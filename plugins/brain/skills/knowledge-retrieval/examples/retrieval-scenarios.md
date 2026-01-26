# Retrieval Scenarios

Example queries with expected retrieval paths and results.

## Scenario 1: Person Query

**User**: "What has Alice been working on?"

**Retrieval path**:
1. Read `.brain/index.md` → Navigate to People → Alice Chen
2. Collect all entries listed under Alice Chen
3. Read recent entries (last 5)
4. Also check `entities/people.md` for Alice's projects and topics

**Expected response**:
> Alice Chen has been primarily focused on the **API v2 Redesign** project. Recent activity:
> - 2026-01-26: Discussed API performance issues and proposed full v2 redesign in [1:1 meeting](knowledge/meetings/2026-01-26-1on1-alice.md)
> - She's also mentoring Dave Junior during his onboarding
>
> **Open action items for Alice**:
> - [ ] Draft API v2 redesign proposal (due 2026-01-31)

## Scenario 2: Action Items Query

**User**: "What are my open action items?"

**Retrieval path**:
1. Grep for `status: open` and `owner: self` across `.brain/knowledge/**/*.md`
2. Collect all matching action items
3. Sort by deadline (earliest first)
4. Group by project/source

**Expected response**:
> You have **4 open action items**:
>
> | Task | Deadline | Source |
> |------|----------|--------|
> | Pull usage analytics from Datadog | 2026-01-30 | [1:1 with Alice](knowledge/meetings/2026-01-26-1on1-alice.md) |
> | Flag Q2 timeline impact to Carol | 2026-02-01 | [1:1 with Alice](knowledge/meetings/2026-01-26-1on1-alice.md) |
> | Forward GraphQL workshop details to Alice | 2026-01-27 | [1:1 with Alice](knowledge/meetings/2026-01-26-1on1-alice.md) |
> | Assign Dave to API docs task | No deadline | [1:1 with Alice](knowledge/meetings/2026-01-26-1on1-alice.md) |

## Scenario 3: Decision Query

**User**: "What decisions have we made about the API?"

**Retrieval path**:
1. Read `.brain/index.md` → Navigate to Projects → API v2 Redesign
2. Filter entries of type `decision`
3. Also search Topics → API Design for decision entries
4. Read each decision file

**Expected response**:
> **Decisions regarding the API**:
>
> 1. **Pursue full API v2 redesign** (2026-01-26)
>    - Context: Rate limiting dropping 30% of legitimate requests
>    - Alternatives considered: Bump rate limits, add caching layer
>    - Outcome: Full redesign chosen for long-term scalability
>    - Source: [1:1 with Alice](knowledge/meetings/2026-01-26-1on1-alice.md)
>
> 2. **Assign Dave to API docs** (2026-01-26)
>    - Context: Dave onboarding, needs tasks to learn the system
>    - Source: [1:1 with Alice](knowledge/meetings/2026-01-26-1on1-alice.md)

## Scenario 4: Temporal Query

**User**: "What happened last week?"

**Retrieval path**:
1. Resolve "last week" → 2026-01-19 to 2026-01-25
2. Read `.brain/index.md` → Navigate to Timeline → 2026-01 → Week 4
3. Collect all entries in date range
4. Read summaries from each entry

**Expected response**:
> **Last week (Jan 19-25)**:
>
> **Meetings**:
> - 2026-01-20: [Sprint Review](knowledge/meetings/2026-01-20-sprint-review.md) — Identified API performance issues
>
> **Decisions**:
> - 2026-01-22: [Code Review Standards](knowledge/decisions/2026-01-22-code-review.md) — Adopted new review checklist
>
> **Insights**:
> - 2026-01-25: [Team Dynamics](knowledge/insights/2026-01-25-team-dynamics.md) — Notes on team collaboration patterns

## Scenario 5: Relationship Query

**User**: "Who works with Alice?"

**Retrieval path**:
1. Read `.brain/entities/people.md` → Find Alice Chen section
2. Extract all relationships
3. For collaborates-with relationships, read the connected person entries
4. Check shared projects and topics

**Expected response**:
> Alice Chen's working relationships:
>
> - **Bob Smith** — Collaborates on API redesign project
> - **Dave Junior** — Alice is mentoring Dave during onboarding
> - **Carol Director** — Alice reports to Carol; Carol is stakeholder for Q2 planning
>
> Shared projects: API v2 Redesign (with Bob, Dave)

## Scenario 6: Cross-Entity Query

**User**: "How does the API redesign affect Q2 planning?"

**Retrieval path**:
1. Read `.brain/index.md` → Projects → API v2 Redesign
2. Check `relationships` in the relevant knowledge files
3. Find: `api-redesign` blocks `q2-planning`
4. Read Q2-related entries for impact details
5. Check for flagged risks or concerns

**Expected response**:
> The **API v2 Redesign** has a blocking relationship with **Q2 Planning**:
>
> - The full redesign may push back the Q2 feature timeline
> - Carol needs a concrete proposal before the Q2 planning meeting (Feb 15)
> - Action item: Flag potential timeline impact to Carol (due 2026-02-01)
>
> **Risk level**: High — if the redesign scope is large, Q2 features may be delayed.
> Source: [1:1 with Alice](knowledge/meetings/2026-01-26-1on1-alice.md)

## Scenario 7: No Results

**User**: "What do we know about the mobile app?"

**Retrieval path**:
1. Read `.brain/index.md` → Search for "mobile app" in all sections
2. Search `entities/topics.md` for "mobile"
3. Grep across knowledge files for "mobile"
4. No matches found

**Expected response**:
> No indexed knowledge found about "mobile app". The Brain knowledge base currently doesn't have any entries related to this topic.
>
> To add this knowledge:
> - If you have notes about the mobile app, run `/brain:index [path-to-notes]`
> - Or discuss the mobile app topic and I'll suggest indexing the conversation
