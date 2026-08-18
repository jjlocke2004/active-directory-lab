<#
.SYNOPSIS
    Deprovisions a terminated Active Directory user account.
.DESCRIPTION
    Disables the target user account, strips non-primary group memberships,
    resets the password to a randomized complex string, and moves the object
    to a designated Disabled Users OU.
.PARAMETER SamAccountName
    The username of the terminated employee.
.PARAMETER TargetOU
    The Distinguished Name (DN) of the Disabled Users holding OU.
.EXAMPLE
    .\ADUserRemove.ps1 -SamAccountName "test.user" -TargetOU "OU=Disabled Users,DC=soclab,DC=local"
#>
param(
    [Parameter(Mandatory = $true)]
    [string]$SamAccountName,

    [string]$TargetOU = "OU=Disabled Users,DC=soclab,DC=local"
)

Write-Host "[*] Starting Offboarding Process for: $SamAccountName..." -ForegroundColor Yellow

# 1. Disable user account
Disable-ADAccount -Identity $SamAccountName
Write-Host "Account Disabled." -ForegroundColor Green

# 2. Reset Password to a Random Secure Complex String
$randomBytes = New-Object byte[] 16
(New-Object System.Security.Cryptography.RNGCryptoServiceProvider).GetBytes($randomBytes)
$randomPassword = [Convert]::ToBase64String($randomBytes) + "A1!"

Set-ADAccountPassword -Identity $SamAccountName -NewPassword (ConvertTo-SecureString $randomPassword -AsPlainText -Force) -Reset
Write-Host "Password reset to randomized strong key." -ForegroundColor Green

# 3. Strip all group membership (Excluding Primary 'Domain Users')
$UserGroups = Get-ADPrincipalGroupMembership -Identity $SamAccountName | Where-Object Name -ne "Domain Users"
foreach ($Group in $UserGroups) {
    Remove-ADGroupMember -Identity $Group -Members $SamAccountName -Confirm:$false
    Write-Host "Removed from group: $($Group.Name)" -ForegroundColor Gray
}

# 4. Move account to Disabled Users OU
$UserDN = (Get-ADUser -Identity $SamAccountName).DistinguishedName
Move-ADObject -Identity $UserDN -TargetPath $TargetOU
Write-Host "Moved account to $TargetOU" -ForegroundColor Green

Write-Host "Offboarding complete!" -ForegroundColor Cyan