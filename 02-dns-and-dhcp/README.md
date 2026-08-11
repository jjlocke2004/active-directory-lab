# Phase 2: DNS and DHCP Configuration
This document covers name resolution and dynamic IP addressing setup on `DC01`, including installation and authorization of the DHCP Server role and deployment of the `Corp-Workstations` scope.

## Environment Details

* **DNS Server:** `DC01` (`192.168.100.7`) — installed automatically during AD DS promotion in Phase 1
* **DHCP Server:** `DC01` (`192.168.100.7`)
* **Scope Name:** `Corp-Workstations`
* **Scope Range:** `192.168.100.50` – `192.168.100.150`
* **Subnet Mask:** `255.255.255.0`

---

## DNS Configuration

DNS was installed alongside Active Directory Domain Services during the Phase 1 promotion of `DC01` to domain controller. All domain-joined hosts point their preferred DNS server to `192.168.100.7`, allowing name resolution for `soclab.local` and enabling clients to locate the domain controller for authentication (SRV records, LDAP, Kerberos).

## DHCP Server Role Installation

1. **Role Installation:** Added the DHCP Server role to `DC01` via Server Manager.
 
   ![DHCP Role Install](images/dc01-dhcp-role-install.png)

2. **Post-Install Configuration:** Completed the DHCP post-deployment configuration wizard.
 
   ![DHCP Post-Install Success](images/dc01-post-install-success.png)

3. **Authorization in Active Directory:** Authorized the DHCP server in AD DS so it's permitted to lease addresses on the domain (unauthorized DHCP servers are ignored by domain-joined clients).
 
   ![DHCP Authorization Prompt](images/dc01-dhcp-auth-prompt.png)

## Scope Configuration

1. **Scope Creation:** Created the `Corp-Workstations` scope with an address range of `192.168.100.50` – `192.168.100.150`, reserving `.1`–`.49` for infrastructure (DC, gateway, static hosts).

   ![DHCP Scope IP Range](images/dc01-dhcp-scope-ip-range.png)

2. **Scope Activation:** Activated the scope to begin leasing addresses to clients on the `192.168.100.0/24` segment.

    ![DHCP Scope Active](images/dc01-dhcp-scope-active.png)

---

## Client Verification

1. **Adapter Configuration:** Set the `DESKTOP-O3IVBE1` network adapter to obtain an IP address automatically (DHCP) instead of a static assignment.

    ![Client Adapter Set to DHCP](images/client-adapter-set-to-dhcp.png)

3. **Lease Confirmation:** Ran `ipconfig /release` and `ipconfig /renew` on `WKSTN01`, confirming it received a lease within the `Corp-Workstations` scope range and that the DNS server was correctly assigned as `192.168.100.7`.

    ![Client ipconfig Renew Success](images/client-ipconfig-renew-success.png)

---

## Verification

* Confirmed the DHCP role shows as **Authorized** in the DHCP console.
* Confirmed `DESKTOP-O3IVBE1` received a lease within the `192.168.100.50–150` range.
* Confirmed DNS resolution and domain connectivity persisted after switching from static to DHCP addressing.
