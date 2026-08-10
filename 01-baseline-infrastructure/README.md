# Phase 1: Baseline Infrastructure Setup

This document covers the initial deployment of the core domain controller and domain membership.

## Environment Details

* **Operating System:** Windows Server 2025 (Desktop Experience)
* **Domain Controller Name:** `DC01`
* **Domain Name:** `corp.local`
* **Static IP:** `192.168.10.10/24`
* **Preferred DNS:** `127.0.0.1`

---

## Deployment Summary

1. **Server Deployment:** Installed Windows Server 2025 VM with static IP configuration (`192.168.10.10`).
2. **AD DS Promotion:** Installed Active Directory Domain Services and DNS server roles. Promoted server as the root Domain Controller for `corp.local`.
3. **Workstation Integration:** Installed Windows 11 Enterprise (`WKSTN01`), pointed preferred DNS to `192.168.10.10`, and joined the machine to the `corp.local` domain.

---

## Verification

* Verified Active Directory Domain Services and DNS services are active on `DC01`.
* Confirmed `WKSTN01` is listed in the `Computers` container and reachable via domain logon.
