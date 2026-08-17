<#
.Description
This powershell script allows for the easy onboarding of one new user to the Active Directory.

This script will take the Name, Department, and Title of the new hire
and set up a user account in the AD, also joining that user to the
appropriate security groups.

It will also set up a temp password that will require a change at first login.
#>

# Set parameters for script (prompts input for each when script is ran)
param(
    [Parameter(Mandatory=$true)]
    [string]$FirstName,

    [Parameter(Mandatory=$true)]
    [string]$LastName,

    [Parameter(Mandatory=$true)]
    [string]$Department,

    [Parameter(Mandatory=$true)]
    [string]$Title
)

Import-Module ActiveDirectory -ErrorAction Stop

$domain      = "soclab.local"
$domainDN    = "DC=soclab,DC=local"
$usersRootOU = "OU=SOCLAB Users,$domainDN"
$defaultPass = "ChangeMe2026!"   # temp password

$deptMap = @{
    "Finance"    = @{ OU = "Finance";    Group = "Finance Staff" }
    "HR"         = @{ OU = "HR";         Group = "HR Staff" }
    "IT"         = @{ OU = "IT";         Group = "IT-Staff" }
    "Management" = @{ OU = "Management"; Group = "Management Staff" }
}

# --- Build the values AD actually needs ---
$ouName      = $deptMap[$Department].OU
$groupName   = $deptMap[$Department].Group
$targetOU    = "OU=$ouName,$usersRootOU"
$sam         = ("$FirstName.$LastName").ToLower()
$upn         = "$sam@$domain"
$displayName = "$FirstName $LastName"

# --- Create the account ---
New-ADUser `
    -Name $displayName `
    -GivenName $FirstName `
    -Surname $LastName `
    -SamAccountName $sam `
    -UserPrincipalName $upn `
    -Path $targetOU `
    -Department $Department `
    -Title $Title `
    -AccountPassword (ConvertTo-SecureString $defaultPass -AsPlainText -Force) `
    -ChangePasswordAtLogon $true `
    -Enabled $true

# --- Add the new account to its department's security group ---
Add-ADGroupMember -Identity $groupName -Members $sam

Write-Host "Created user: $displayName ($sam) in $targetOU, added to $groupName"
