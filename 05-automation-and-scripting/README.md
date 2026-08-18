# Phase 5: PowerShell Administration & Automation

This section documents the PowerShell scripts built to automate routine Active Directory administration in `soclab.local`: 
onboarding, offboarding, and locked-account triage — the same tasks handled manually (and by hand-entered tickets) in earlier phases.

All scripts target the `ActiveDirectory` PowerShell module (RSAT) and are designed to run under a **`Helpdesk Staff`** account where possible, 
in line with the delegated administration model set up in [Phase 3](../03-ou-and-rbac-design/README.md).

---

## Scripts
| Script | Purpose | Requires Domain Admin? |
|---|---|---|
| [`ADUserAdd.ps1`](scripts/ADUserAdd.ps1) | Creates a single new hire account, creates temp pass, places them in the correct department ou, and adds them to the matching security group | No, delegated rights on `SOCLAB Users` OU |
| [`ADUserBulkAdd.ps1`](scripts/ADUserBulkAdd.ps1) | Ingests a CSV of new hires creates accounts, temp passes, places them in correct department ou and adds them to the matching security group | No, delegated rights on `SOCLAB Users` OU |
| `ADUserRemove.ps1` - planned | Disables a terminated employee's account, strips all group membership, resets the password, and moves the object to a `Disabled Users` holding OU | Yes |

---

## ADUserAdd.ps1

[`ADUserAdd.ps1`](scripts/ADUserAdd.ps1)

Prompts for an input of first name, last name, department, and job title.

To run:
```powershell
.\ADUserAdd.ps1
```

You can alternatively add the values in one command:

```powershell
.\ADUserAdd.ps1 -FirstName Jonathon -LastName Locke -Department IT -Title Support Tech
```

Test:
![ADUserAdd.ps1 Test](images/ad-single-user-add-test.png)

---

## ADUserBulkAdd.ps1

Prompts for an input of the CSV path 

To run in one command:
```powershell
.\ADUserBulkAdd.ps1 -CsvPath C:\Path\to\csv
```

Test:
*Here I run the script*

![Running ADUserBulkAdd.ps1](images/running-ad-bulk-user-add.png)

*Here I verify the users got created and added to the right groups*

![Verify New Users and Groups](images/verify-new-users-and-groups.png)

*Here I confirm the log file was created and containing correct info*

![Confirm Log File Creation](images/confirm-creation-of-log-file.png)
