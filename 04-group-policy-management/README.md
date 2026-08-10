# Phase 4: Group Policy Management & Security Baseline

This section details the custom Group Policy Objects (GPOs) configured to enforce security baselines and advanced security auditing across the domain.

---

## Applied Policies

### 1. Default Domain Password Policy
* Enforces password length, complexity, and account lockout parameters across all user accounts in `corp.local`.

### 2. Advanced Security Audit Policy GPO
Configured via `Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration`:

* **Logon/Logoff:** Audit Logon (Success/Failure), Audit Account Lockout (Success).
* **Account Management:** Audit User Account Management (Success/Failure), Audit Security Group Management (Success).
* **Detailed Tracking:** Audit Process Creation (Success) — Enforced command-line process logging via GPO setting:
  * *Administrative Templates -> System -> Audit Process Creation -> Include command line in process creation events*.

---

## Verification & Event Generation

Auditing policies were validated on `DC01` and `WKSTN01` by reviewing Event Viewer logs:
* **Event ID 4624:** Successful User Account Logon.
* **Event ID 4688:** Process Creation (verifying process command-line arguments are captured).
* **Event ID 4740:** User Account Lockout.

## Screenshots (ADD LATER)

    gpmc-audit-policy.png: Group Policy Management Console (gpmc.msc) showing your Audit Policy settings details tab.

    event-viewer-4688.png: Event Viewer (security.evtx) showing Event ID 4688 with command-line auditing visible in the log details.
