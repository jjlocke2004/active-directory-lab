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
| 04 | File Access (Finance) | "I can't get into the finance shared drive, I need it for a report due today" |
| 05 | Password Reset (HR) | "I forgot my password and don't have a way to reset it myself" |

---

##  Ticket 03 - Offboarding

Description: HR requests immediate offboarding of Michasel Brown (IT) - termination effective today.

I chose to close this ticket first due to the security implications of having a terminated employee with active access.

Impact: High (security) | Urgency: Highest

[Ticket 03 - Offboarding](ticket-03-offboarding.md)

---

## Ticket 02 - Account Lockout (Management)

"I keep typing my password right and it says my account is locked, I can't get into my computer"

Description: User is locked out of their account and cannot get into their computer

I chose to close this ticket next because its a full work stoppage for one person, and the role/seniority does hold some factors in triage. 

Impact: Medium-High | Urgency: High

[Ticket 02 - Account Lockout](ticket-02-account-lockout.md)

---

## Ticket 05 - Password Reset (HR)
*This one I haven't created a script for yet so I will just being do this one manually.
I will create a script for this later on*

Description: "I forgot my password and don't have a way to reset it myself."

I chose this ticket next because this is also a full work stoppage for one person. This is very close in severity to ticket #02 - the tiebreaker here is nuanced - which ticket really came first etc.

Impact: Medium-High | Urgency: High

[Ticket 05 - Password Reset(HR)](ticket-05-password-reset.md)

---

## Ticket 04 - File Access (Finance)
*I also really haven't made a script for this specifically yet this could definitely be a good automation - checks if user is in all appropriate security groups*

I chose this one second to last because it's a partial blocker, this person likely can still do some work, just not the specific report. 

The deadline of today adds urgency but its not a full outage like tickets 02 and 05

Impact: Medium | Urgency: Medium-High 

[Ticket 04 - File Access](ticket-04-file-access.md)

---

## Ticket 01 - Onboarding
*This one I am only going to use the script for and not manually do it to test since I think we all know how much time this saves to run in one command as opposed to entering in every new hire and detail manually* 

I chose to do this one last since nothing breaks if this waits a few hours. The new hires don't start 'till Monday.

Impact: Low (for today) | Urgency: Low

[Ticket 01 - Onboarding](ticket-01-onboarding.md)
