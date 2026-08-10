# Phase 2: Organizational Unit (OU) & RBAC Design

This section documents the Active Directory Organizational Unit (OU) structure, provisioned departmental user accounts, and Role-Based Access Control (RBAC) security groups.

---

## Organizational Unit Structure

To move away from default flat containers, an enterprise OU structure was implemented under `corp.local`:

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
