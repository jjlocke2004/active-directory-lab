<#
.SYNOPSIS
    Checks and unlocks a locked-out Active Directory user account.
.Description
    Checks the lockout status of the target user account. If the account
    is locked out, it unlocks the account and confirms the change took effect.
.PARAMETER SamAccountName
    The username of the affected employee.
.EXAMPLE
    .\ADAccountLockout.ps1 -SamAccountName "test.user"
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$SamAccountName
)

Import-Module ActiveDirectory -ErrorAction Stop

# Look up the account and check it lockout status

$user = Get-ADUser -Identity $SamAccountName -Properties LockedOut, Name

if ($user.LockedOut -eq $false) {
    Write-Host "$($user.Name) ($SamAccountName) is not locked out. No action taken."
}
else {
    Write-Host "$($user.Name) ($SamAccountName) is currently locked out. Unlocking..."
    
    Unlock-ADAccount -Identity $SamAccountName

    # Recheck the account to confirm it was unlocked
    $userAfter = Get-ADUser -Identity $SamAccountName -Properties LockedOut

    if ($userAfter.LockedOut -eq $false) {
        Write-Host "Success: $($user.Name) ($SamAccountName) is now unlocked"
    }
    else {
        Write-Host "Something went wrong: $($user.Name) ($SamAccountName) still shows as locked out."
    }
}
