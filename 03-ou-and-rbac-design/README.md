# Phase 3: Organizational Unit (OU) & RBAC Design

This section documents the Active Directory Organizational Unit (OU) structure, provisioned departmental user accounts, and Role-Based Access Control (RBAC) security groups.

---

## Organizational Unit Structure

To move away from default flat containers, an enterprise OU structure was implemented under `soclab.local`:

```text
corp.local
└── Corp-Objects
    ├── Administration
    │   ├── Admin-Accounts
    │   └── Admin-Groups
    ├── Departments
    │   ├── IT
    │   ├── Finance
    │   ├── HR
    │   └── Sales
    ├── Groups
    └── Workstations
```
## Identity & Group Management

**Security Groups Created:**

- IT-Staff — Members: IT Department personnel.

- Finance-Users — Members: Finance team members.

- HR-Users — Members: HR team members.

- HelpDesk-Admins — Delegated administration accounts for daily tasks.
  
## Provisioned Users

User accounts were generated across each department with standard attributes (First/Last Name, UPN, Department attribute) and assigned to their respective security groups.
