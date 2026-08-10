# Enterprise Active Directory Lab & Administration

A dedicated enterprise Active Directory environment built to simulate real-world Windows domain administration, identity management, Group Policy enforcement, PowerShell automation, and Help Desk operations.

This environment serves as the core **Identity & Infrastructure Layer** designed to integrate directly with external monitoring and security platforms (such as the [Home SOC Lab](https://github.com/jjlocke2004/home-soc-lab)).

---

## Architecture Overview

* **Domain Name:** `corp.local`
* **NetBIOS Name:** `CORP`
* **Network Segment:** Private NAT / Host-Only (`192.168.10.0/24`)

| Hostname | Role / Service | OS | IP Address | Subnet |
| :--- | :--- | :--- | :--- | :--- |
| **DC01** | Primary Domain Controller (AD DS, DNS, DHCP) | Windows Server 2025 | `192.168.10.10` | `/24` |
| **WKSTN01** | Domain-Joined Enterprise Workstation | Windows 11 Enterprise | `192.168.10.50` | `/24` |

---

## Progress Checklist

- [x] **Phase 1: Baseline Infrastructure Setup** — Deployed Windows Server 2025 DC (`DC01`), promoted to forest root (`corp.local`), configured static networking, and joined Windows 11 workstation.
- [x] **Phase 2: Organizational Unit (OU) & Identity Architecture** — Designed department-based OUs, provisioned initial user accounts, and configured Security Groups with role memberships.
- [x] **Phase 3: Group Policy & Audit Policy Baseline** — Implemented central GPOs for password security and Advanced Security Audit Policies.
- [ ] **Phase 4: PowerShell Administration & Automation** — Bulk user onboarding/offboarding scripts.
- [ ] **Phase 5: Simulated Help Desk & SysAdmin Tickets** — Documenting operational scenarios (account lockouts, permission requests).
- [ ] **Phase 6: SOC Integration & Event Forwarding** — Forwarding security log events to [Home SOC Lab](https://github.com/jjlocke2004/home-soc-lab)).

---

## Repository Structure

```text
├── 01-baseline-infrastructure/  # Server 2025 promotion & domain joining setup
├── 02-ou-and-rbac-design/        # OU tree hierarchy, user accounts, and security groups
├── 03-group-policy-management/  # Applied GPOs and Advanced Audit Logging configuration
├── 04-automation-and-scripting/ # PowerShell operational scripts (Planned)
├── 05-helpdesk-tickets/          # Simulated IT administration ticket logs (Planned)
