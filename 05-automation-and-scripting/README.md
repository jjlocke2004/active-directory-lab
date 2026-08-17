# Phase 5: PowerShell Administration & Automation

This section documents the PowerShell scripts built to automate routine Active Directory administration in `soclab.local`: 
bulk onboarding, offboarding, and locked-account triage — the same tasks handled manually (and by hand-entered tickets) in earlier phases.

All scripts target the `ActiveDirectory` PowerShell module (RSAT) and are designed to run under a **`Helpdesk Staff`** account where possible, 
in line with the delegated administration model set up in [Phase 3](../03-ou-and-rbac-design/README.md).
