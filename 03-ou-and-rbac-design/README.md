# Phase 3: Organizational Unit (OU) & RBAC Design

This section documents the Active Directory Organizational Unit structure, provisioned departmental accounts, and Role-Based Access Control (RBAC) security groups for `soclab.local`.

---

## Organizational Unit Structure

To move away from the default flat containers, a departmental OU structure was implemented under `soclab.local`:

```text
soclab.local
├── Admin Accounts
├── Domain Controllers
├── Service Accounts
├── SOCLAB Computers          (SOCLab - Restrict Local Admin GPO linked here)
├── SOCLAB Groups
└── SOCLAB Users
    ├── Finance
    ├── HR
    ├── IT
    └── Management
```

![OU Structure](images/ou-structure-full.png)

---

## Identity & Group Management

**Security groups (`SOCLAB Groups` OU):**
- `File Share - Finance` - Share folder for Finances
- `Finance Staff` — Finance team members
- `Helpdesk Staff` — delegated administration account(s) for day-to-day helpdesk tasks
- `HR Staff` — HR team members
- `IT-Staff` — IT department personnel
- `Management-Staff` - Management team members
- `VPN Users`

![Security Groups](images/security-groups-list.png)

![Security Group Membership](images/group-membership.png)

---

## Provisioned Users

User accounts were generated across each department with standard attributes (First/Last Name, UPN, `Department` attribute) and assigned to their respective security group.

![User Account Properties Example](images/user-account-properties.png)

---

## Delegated Administration

`Helpdesk Staff` was granted delegated permissions to perform routine account tasks (password resets, unlocks) without full Domain Admin rights.

---

## Verification

* Confirmed OU tree matches the structure above via `dsa.msc`.
* Confirmed each security group contains the expected department members.
* Confirmed `Helpdesk Staff` can perform delegated actions without Domain Admin membership.
