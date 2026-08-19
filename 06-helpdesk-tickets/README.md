# Helpdesk Tickets
This document will cover typical helpdesk tickets seen in an IT Support environment. I will work through them with the help of my previously created scripts to show how automation can help in real world scenarios. I will also work through them the manual way to better remember the underlying processes and for full documentation.

I will set a time constraint for each ticket, and will try to work through multiple tickets within that constraint. Timestamps on commits also serve as a natural record of how long each ticket actually took.

The current 5 tickets we will assume came in all at the same time and I will triage by severity + urgency.

Each ticket below is worked two ways:

- **Scripted** — using the relevant script from Phase 5
- **Manual** — using `dsa.msc` / native AD tools, to reinforce the underlying process

---

## Planned Tickets

| Ticket # | Subject | Description |
|---|---|---|
| 01 | Onboarding | HR requests AD accounts be created for new hires starting Monday |
| 02 | Account Lockout | "I keep typing my password right and it says my account is locked, I can't get into my computer" |
| 03 | Offboarding | HR requests immediate offboarding of Michael Brown (IT) — termination effective today |
| 04 | Access | "I can't get into the finance shared drive, I need it for a report due today" |
| 05 | Account | "I forgot my password and don't have a way to reset it myself" |

---

# Ticket 03 - Offboarding

Description: HR requests immediate offboarding of Michasel Brown (IT) - termination effective today.

I chose to close this ticket first due to the security implications of having a terminated employee with active access.

Impact: High | Urgency: High

[Ticket 03 - Offboarding](ticket-03-offboarding.md)
