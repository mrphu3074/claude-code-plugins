# Entity Schemas

Full YAML schemas for the entity registry files in `.brain/entities/`.

## People Schema (entities/people.md)

```markdown
---
version: 0.1.0
last_updated: 2026-01-26
---

# People

## Alice Chen
- **ID**: alice-chen
- **Aliases**: Alice, AC, @alice
- **Role**: Senior Backend Engineer
- **Team**: Platform
- **Relationships**:
  - collaborates-with: [bob-smith](bob-smith) (API redesign)
  - reports-to: [Carol Director](carol-director)
  - mentors: [Dave Junior](dave-junior)
- **Topics**: api-redesign, backend-architecture, rate-limiting
- **First seen**: 2026-01-15
- **Last seen**: 2026-01-26
- **Mentions**: 12
- **Recent activity**:
  - 2026-01-26: [1:1 - API Redesign](../knowledge/meetings/2026-01-26-1on1-alice.md)
  - 2026-01-20: [Sprint Review](../knowledge/meetings/2026-01-20-sprint-review.md)

## Bob Smith
- **ID**: bob-smith
...
```

### Field Definitions

| Field | Required | Description |
|-------|----------|-------------|
| ID | Yes | Unique kebab-case identifier |
| Aliases | No | Alternative names/references |
| Role | No | Job title or role description |
| Team | No | Team or department |
| Relationships | No | Typed connections to other people |
| Topics | No | Topics this person is associated with |
| First seen | Yes | Date of first mention |
| Last seen | Yes | Date of most recent mention |
| Mentions | Yes | Total mention count across all entries |
| Recent activity | No | Last 5 knowledge entries mentioning this person |

### Relationship Types for People

| Type | Description | Example |
|------|-------------|---------|
| collaborates-with | Works together on something | Shared project or task |
| reports-to | Direct reporting relationship | Manager/report |
| mentors | Teaching/guidance relationship | Senior mentoring junior |
| conflicts-with | Disagreement or tension noted | Opposing views on approach |
| stakeholder-for | Has interest in outcome | Executive sponsoring project |
| delegates-to | Assigns work to | Lead assigning tasks |

## Projects Schema (entities/projects.md)

```markdown
---
version: 0.1.0
last_updated: 2026-01-26
---

# Projects

## API v2 Redesign
- **ID**: api-v2-redesign
- **Status**: in-progress
- **Priority**: high
- **Owner**: [Alice Chen](../entities/people.md#alice-chen)
- **Contributors**: [Bob Smith](../entities/people.md#bob-smith)
- **Topics**: api-design, backend-architecture, rate-limiting
- **Timeline**:
  - Started: 2026-01-15
  - Target: 2026-03-31 (Q1)
- **Dependencies**:
  - blocks: q2-launch
  - depends-on: database-migration
- **Decisions**:
  - [Proceed with full redesign](../knowledge/decisions/2026-01-26-api-v2-redesign.md)
- **Action Items**:
  - [ ] Draft proposal (@alice-chen, due 2026-02-01)
  - [ ] Review usage metrics (@self, due 2026-01-30)
- **Recent activity**:
  - 2026-01-26: [1:1 Discussion](../knowledge/meetings/2026-01-26-1on1-alice.md)
```

### Field Definitions

| Field | Required | Description |
|-------|----------|-------------|
| ID | Yes | Unique kebab-case identifier |
| Status | Yes | One of: planned, in-progress, on-hold, completed, cancelled |
| Priority | No | high, medium, low |
| Owner | No | Primary responsible person |
| Contributors | No | Other people involved |
| Topics | No | Related topic IDs |
| Timeline | No | Start date and target date |
| Dependencies | No | blocks / depends-on relationships |
| Decisions | No | Links to decision knowledge entries |
| Action Items | No | Open action items for this project |
| Recent activity | No | Last 5 related knowledge entries |

## Topics Schema (entities/topics.md)

```markdown
---
version: 0.1.0
last_updated: 2026-01-26
---

# Topics

## Engineering
### Backend Architecture
- **ID**: backend-architecture
- **Parent**: engineering
- **Related**: api-design, database, deployment
- **People**: [Alice Chen](../entities/people.md#alice-chen), [Bob Smith](../entities/people.md#bob-smith)
- **Projects**: [API v2 Redesign](../entities/projects.md#api-v2-redesign)
- **Mentions**: 15
- **Recent**:
  - 2026-01-26: [API Redesign Discussion](../knowledge/meetings/2026-01-26-1on1-alice.md)

#### API Design
- **ID**: api-design
- **Parent**: backend-architecture
- **Related**: rate-limiting, authentication
...

## Product
### Q2 Planning
- **ID**: q2-planning
- **Parent**: product
...
```

### Topic Hierarchy Rules

1. Use markdown heading levels to represent hierarchy (## = top, ### = child, #### = grandchild)
2. Maximum 4 levels deep
3. Each topic heading is followed by its metadata
4. Topics can appear under multiple parents via cross-references
5. New topics are added alphabetically within their parent section

### Field Definitions

| Field | Required | Description |
|-------|----------|-------------|
| ID | Yes | Unique kebab-case identifier |
| Parent | No | Parent topic ID |
| Related | No | Related topic IDs |
| People | No | People associated with this topic |
| Projects | No | Projects under this topic |
| Mentions | Yes | Total mention count |
| Recent | No | Last 3 related knowledge entries |

## Source Tracking Schema (sources.md)

```markdown
---
version: 0.1.0
---

# Indexed Sources

| Source Path | Indexed Date | Hash | Knowledge Files |
|-------------|-------------|------|-----------------|
| ./notes/2026-01-26-alice-1on1.md | 2026-01-26 | a1b2c3 | meetings/2026-01-26-1on1-alice-api-redesign.md |
| ./journal/2026-01-25.md | 2026-01-25 | d4e5f6 | insights/2026-01-25-team-dynamics.md |
```

### Fields

| Field | Description |
|-------|-------------|
| Source Path | Relative path to original file |
| Indexed Date | When the source was indexed |
| Hash | Short hash of source content at index time (for change detection) |
| Knowledge Files | Comma-separated list of generated knowledge files |

## Master Index Schema (index.md)

The master index organizes all knowledge entity-centrically for tree-based retrieval:

```markdown
---
version: 0.1.0
last_updated: 2026-01-26
total_entries: 42
total_people: 8
total_projects: 5
total_topics: 23
---

# Brain Index

## People
### Alice Chen
- [1:1 - API Redesign Discussion](knowledge/meetings/2026-01-26-1on1-alice.md) | 2026-01-26 | meeting
- [Sprint Review](knowledge/meetings/2026-01-20-sprint-review.md) | 2026-01-20 | meeting

### Bob Smith
- [Code Review Standards](knowledge/decisions/2026-01-22-code-review.md) | 2026-01-22 | decision

## Projects
### API v2 Redesign
- [Decision: Full Redesign](knowledge/decisions/2026-01-26-api-v2.md) | 2026-01-26 | decision
- [1:1 Discussion](knowledge/meetings/2026-01-26-1on1-alice.md) | 2026-01-26 | meeting

## Topics
### Backend Architecture
- [API Redesign Discussion](knowledge/meetings/2026-01-26-1on1-alice.md) | 2026-01-26

### Team Management
- [1:1 Best Practices](knowledge/insights/2026-01-25-1on1-tips.md) | 2026-01-25

## Timeline
### 2026-01
#### Week 4 (Jan 20-26)
- 2026-01-26: [1:1 Alice - API Redesign](knowledge/meetings/2026-01-26-1on1-alice.md)
- 2026-01-25: [Team Dynamics Insight](knowledge/insights/2026-01-25-team-dynamics.md)
- 2026-01-22: [Code Review Standards](knowledge/decisions/2026-01-22-code-review.md)
- 2026-01-20: [Sprint Review](knowledge/meetings/2026-01-20-sprint-review.md)
```

### Index Entry Format

Each entry follows: `- [Title](relative-path) | date | type`

This format enables:
- **Tree navigation**: LLM reasons through headings to find relevant sections
- **Entity lookup**: Find all entries for a person, project, or topic
- **Timeline browsing**: Scan chronologically
- **Type filtering**: Filter by meeting, decision, action-item, insight
