# Enterprise Active Directory Lab & Administration

A dedicated enterprise Active Directory environment built to simulate real-world Windows domain administration, identity management, Group Policy enforcement, PowerShell automation, and Help Desk operations.

This environment serves as the core **Identity & Infrastructure Layer** designed to integrate directly with external monitoring and security platforms (such as the [Home SOC Lab](https://github.com/jjlocke2004/home-soc-lab)).

---

## Architecture Overview

* **Domain Name:** `soclab.local`
* **NetBIOS Name:** `SOCLAB`
* **Network Segment:** Private NAT / Host-Only (`192.168.100.0/24`)

| Hostname | Role / Service | OS | IP Address | Subnet |
| :--- | :--- | :--- | :--- | :--- |
| **DC01** | Primary Domain Controller (AD DS, DNS, DHCP) | Windows Server 2025 | `192.168.100.7` | `/24` |
| **DESKTOP-O3IVBE1** | Domain-Joined Enterprise Workstation | Windows 10 Enterprise | `192.168.100.50` | `/24` |

---

## Progress Checklist
- [x] **Phase 1: Baseline Infrastructure Setup** — Deployed Windows Server 2025 Domain Controller (`DC01`), promoted forest root (`soclab.local`), configured static networking, and completed initial Windows 11 workstation domain join.
- [x] **Phase 2: DNS & DHCP Configuration** — Configured DNS name resolution, installed and authorized DHCP Server role in Active Directory, and deployed dynamic IP scope `Corp-Workstations` (`192.168.100.50–150`).
- [x] **Phase 3: Organizational Unit (OU) & RBAC Architecture** — Designed departmental OU tree hierarchy (`Finance`, `HR`, `IT`, `Management`), provisioned identity accounts, and mapped Role-Based Access Control (RBAC) security groups.
- [x] **Phase 4: Group Policy & Audit Policy Baseline** — Enforced domain-wide password complexity, account lockout rules, local admin restrictions, and enabled Advanced Security Audit Policies (Event ID 4688 process creation tracking).
- [ ] **Phase 5: PowerShell Administration & Automation** — *(Planned)* Bulk user onboarding/offboarding automation and Active Directory management scripts.
- [ ] **Phase 6: Simulated IT Help Desk Tickets** — *(Planned)* Documented operational administration scenarios (account lockouts, permission modifications, connectivity troubleshooting).
- [ ] **Phase 7: SOC Integration & Event Forwarding** — *(Planned)* Exporting Security Event log telemetry to the external [Home SOC Lab](https://github.com/jjlocke2004/home-soc-lab) environment.

---

## Repository Structure

[01 - Baseline Infrastructure](./01-baseline-infrastructure/README.md): Windows Server Domain Controller promotion and domain join setup.
[02 - DNS & DHCP Configuration](./02-dns-and-dhcp/README.md): Name resolution, DHCP role authorization, and scope design.
[03 - OU & RBAC Architecture](./03-ou-and-rbac-design/README.md): Departmental OU structure, user accounts, and administrative roles.
[04 - Group Policy Management](./04-group-policy-management/README.md): Security baselines and Advanced Audit Policy telemetry logging.
[05 - Automation & Scripting](./05-automation-and-scripting/README.md): *(Planned)* PowerShell administrative automation.
[06 - Helpdesk Tickets](./06-helpdesk-tickets/README.md): *(Planned)* Simulated IT administration ticket logs.
