---
title: "1:1 with Alice Chen - API Performance & Redesign"
date: 2026-01-26
type: meeting
topics: [api-redesign, rate-limiting, backend-architecture, q2-planning, onboarding]
people: [alice-chen, bob-smith, carol-director, dave-junior]
source: ./notes/2026-01-26-alice-1on1.md
action_items:
  - task: "Draft API v2 redesign proposal"
    owner: alice-chen
    deadline: 2026-01-31
    status: open
    context: "She's going to put together a proposal for a v2 redesign by next Friday"
    confidence: high
  - task: "Pull usage analytics from Datadog"
    owner: self
    deadline: 2026-01-30
    status: open
    context: "I need to pull the usage analytics from Datadog before then"
    confidence: high
  - task: "Flag potential Q2 timeline impact to Carol"
    owner: self
    deadline: 2026-02-01
    status: open
    context: "Need to flag this to Carol early"
    confidence: high
  - task: "Forward GraphQL workshop details to Alice"
    owner: self
    deadline: 2026-01-27
    status: open
    context: "I'll forward her the details"
    confidence: high
  - task: "Assign Dave to API docs task"
    owner: self
    deadline: none
    status: open
    context: "She suggested putting him on the API docs task"
    confidence: medium
decisions:
  - decision: "Pursue full API v2 redesign over incremental fixes"
    context: "Rate limiting too aggressive, dropping 30% of legitimate requests. API surface has accumulated tech debt since v1."
    alternatives: ["Bump rate limits", "Add caching layer (Bob's suggestion)"]
    outcome: "Full redesign chosen — caching seen as band-aid, need long-term fix"
    stakeholders: [alice-chen, self]
    confidence: high
  - decision: "Put Dave on API docs for onboarding"
    context: "Alice mentoring Dave, he's picking things up quickly"
    alternatives: []
    outcome: "API docs task helps him learn the system while contributing"
    stakeholders: [alice-chen, dave-junior]
    confidence: medium
relationships:
  - from: alice-chen
    to: api-redesign
    type: owner
  - from: alice-chen
    to: dave-junior
    type: mentors
  - from: bob-smith
    to: api-redesign
    type: contributor
  - from: carol-director
    to: q2-planning
    type: stakeholder
  - from: api-redesign
    to: q2-planning
    type: blocks
  - from: dave-junior
    to: api-redesign
    type: contributor
sentiment: mixed
sentiment_details:
  positive: ["Dave picking things up quickly", "Team aligned on redesign approach"]
  negative: ["30% request drop rate", "Potential Q2 timeline impact", "Accumulated tech debt"]
priority: high
---

# 1:1 with Alice Chen - API Performance & Redesign

## Summary
Discussed critical API performance issues — rate limiting dropping 30% of legitimate requests at peak. Decided to pursue full v2 API redesign over incremental fixes (caching). Alice drafting proposal by Jan 31. Risk of Q2 timeline impact needs early flagging to Carol. Also discussed Dave's onboarding progress.

## Key Points
- Batch endpoint rate limiting is too aggressive, dropping ~30% legitimate requests during peak hours
- Bob previously suggested caching layer, but Alice and self agree this is a band-aid
- Full API v2 redesign preferred for long-term scalability
- Carol needs a concrete proposal before Q2 planning meeting (Feb 15)
- Potential risk: full redesign may push Q2 feature timeline
- Dave's onboarding going well under Alice's mentorship
- Alice interested in GraphQL workshop next month

## Action Items
- [ ] Draft API v2 redesign proposal (@alice-chen, due 2026-01-31)
- [ ] Pull usage analytics from Datadog (@self, due 2026-01-30)
- [ ] Flag potential Q2 timeline impact to Carol (@self, due 2026-02-01)
- [ ] Forward GraphQL workshop details to Alice (@self, due 2026-01-27)
- [ ] Assign Dave to API docs task (@self)

## Decisions
- **Pursue full API v2 redesign**: Rate limiting dropping 30% of requests. Caching layer dismissed as band-aid. Full redesign chosen for long-term fix. Need proposal by Jan 31 for Carol's Q2 planning review.
- **Assign Dave to API docs**: Good onboarding task — learns the system while contributing.

## Context & Notes
- Metrics from last sprint revealed the performance issue
- Bob's caching suggestion was from last week's discussion
- Q2 planning meeting is Feb 15 — hard deadline for proposal
- Dave has been onboarding under Alice's mentorship
- Alice wants to attend GraphQL workshop next month
