<#
.Description
This script allows for easy onboarding of a group of new hires. 
It ingests a CSV file with the names, titles and departments of each new hire.
It makes each new user, assigns them to their department and respective security groups.
It also assigns each user with a temp password that must be changed at first login.

Everytime this script is ran it creates a timestamped log file under .\Logs with each user 
that was created or skipped over, and any errors encountered during the process.
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [string]$CsvPath,

    [string]$LogPath = ".\Logs"
)

Import-Module ActiveDirectory -ErrorAction Stop

$domain = "soclab.local"
$domainDN = "DC=soclab,DC=local"
$usersRootOU = "OU=SOCLAB Users,$domainDN"
$defaultPass = "ChangeMe2026!"

$deptMap = @{
    "Finance" = @{OU="Finance";Group="Finance-Staff"}
    "HR" = @{OU="HR";Group="HR-Staff"}
    "IT" = @{OU="IT";Group="IT-Staff"}
    "Management" = @{OU="Management";Group="Management Staff"}
}

if (-not (Test-Path $CsvPath)) {
    throw "CSV not found at path: $CsvPath"
}

if (-not (Test-Path $LogPath)) {
    New-Item -ItemType Directory -Path $LogPath | Out-Null
}
$logFile = Join-Path $LogPath ("onboarding-{0:yyyy-MM-dd_HHmmss}.log" -f (Get-Date))

function Write-Log {
    param([string]$Message)
    $line = "[{0:yyyy-MM-dd HH:mm:ss}] {1}" -f (Get-Date), $Message
    Add-Content -Path $logFile -Value $line
    Write-Host $line
}

$newHires = Import-Csv -Path $CsvPath

foreach ($hire in $newHires) {

    $dept = $hire.Department.Trim()
    if (-not $deptMap.ContainsKey($dept)) {
        Write-Log "SKIPPED: $($hire.FirstName) $($hire.LastName) - unknown department '$dept'"
        continue
    }

    $ouName = $deptMap[$dept].OU
    $groupName = $deptMap[$dept].Group
    $targetOU = "OU=$ouName,$usersRootOU"

    $first = $hire.FirstName.Trim()
    $last = $hire.LastName.Trim()
    $sam = ("{0}.{1}" -f $first, $last).ToLower() -replace '[^a-z0-9.]', ''
    $upn = "$sam@$domain"
    $displayName = "$first $last"

    if (Get-ADUser -Filter "SamAccountName -eq '$sam'" -ErrorAction SilentlyContinue) {
        Write-Log "SKIPPED: $displayName - account '$sam' already exists"
        continue
    }

    if ($PSCmdlet.ShouldProcess($displayName, "Create AD user in $targetOU")) {
        try {
            $userParams = @{
                Name = $displayName
                GivenName = $first
                Surname = $last
                SamAccountName = $sam
                UserPrincipalName = $upn
                Path = $targetOU
                Department = $dept
                Title = $hire.Title
                AccountPassword = (ConvertTo-SecureString $defaultPass -AsPlainText -Force)
                ChangePasswordAtLogon = $true
                Enabled = $true
                ErrorAction = "Stop"
            }

            New-ADUser @userParams

            Add-ADGroupMember -Identity $groupName -Members $sam -ErrorAction Stop
            Write-Log "CREATED: $displayName ($sam) -> OU=$ouName, Group=$groupName"

            if ($dept -eq "Finance") {
                Add-ADGroupMember -Identity "FS-Finance" -Members $sam -ErrorAction Stop
                Write-Log "ADDED: $sam to 'Finance Share Folder' security group"
            }

            if ($hire.Title -like "*Helpdesk*") {
                Add-ADGroupMember -Identity "Helpdesk" -Members $sam -ErrorAction Stop
                Write-Log "ADDED: $sam to 'Helpdesk' security group"
            }

        }
        catch {
            Write-Log "ERROR: $displayName - $($_.Exception.Message)"
        }
    }
}

Write-Log "Onboarding run complete. Log written to $logPath"