# Ticket 05 - Password Reset

**Description:** "I forgot my password and don't have a way to reset it myself."

**Affected User:** Emily Davis

**Time Constraint:** 5min

### Method 1: Scripted

_Not yet automated — worked manually below. Candidate for a future script (e.g. `ADUserPassReset.ps1`)._

### Method 2: Manual

*First I opened Active Directory Users and Computers, right clicked on Emily Davis and pressed reset password*

[Right-Click Reset Pass](images/right-click-reset-pass.png)

*Then after changing the password and checking prompt for password change at next logon the password was successfully reset*

[Pass Reset Confirm](images/pass-reset-confirm.png)

### Time Taken
Manually ~2min | Script: N/A

Manually this doesn't even take very long but would be worth automating in the future.
