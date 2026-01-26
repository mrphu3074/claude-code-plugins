---
name: Knowledge Indexing
description: This skill should be used when the user asks to "index my notes", "extract action items", "organize meeting notes", "store knowledge", "parse my 1:1 notes", "index this file into brain", "extract metadata from notes", "structure my journal", "process meeting outcomes", or when the user discusses meeting content, 1:1 summaries, retrospectives, brainstorm sessions, or any unstructured knowledge that should be preserved for future retrieval. Provides agentic metadata extraction and structured knowledge storage in the .brain/ directory.
version: 0.1.0
---

# Knowledge Indexing

## Overview

Knowledge indexing transforms unstructured markdown content (meeting notes, 1:1s, journals, brainstorms, retrospectives) into structured, queryable knowledge stored in the `.brain/` directory. The process uses **agentic metadata extraction** — automatically identifying action items, decisions, people, topics, relationships, and timelines even when the author did not explicitly write them.

## Core Concepts

### Agentic Metadata Extraction

Unlike traditional metadata that requires explicit tagging, agentic metadata is **inferred by reading content in context**. From a raw meeting note like "Alice mentioned the API needs a redesign before Q2 launch," extract:

- **Person**: Alice
- **Topic**: API redesign
- **Decision**: API needs redesign (implicit)
- **Timeline**: Before Q2
- **Relationship**: Alice → API redesign (owner/advocate)

### Entity-Centric Organization

All knowledge is organized around three primary entity types:

| Entity | File | Purpose |
|--------|------|---------|
| People | `entities/people.md` | Who, their roles, relationships |
| Projects | `entities/projects.md` | What, status, ownership |
| Topics | `entities/topics.md` | Taxonomy of knowledge areas |

Cross-references link entities together. Each knowledge entry references its source entities.

### .brain/ Directory Structure

```
.brain/
├── index.md                  # Master tree index (heading hierarchy)
├── config.md                 # Brain configuration
├── entities/
│   ├── people.md             # People registry + relationships
│   ├── projects.md           # Projects registry + status
│   └── topics.md             # Topic taxonomy
├── knowledge/
│   ├── meetings/             # Structured meeting notes
│   ├── decisions/            # Extracted decisions
│   ├── action-items/         # Extracted action items
│   └── insights/             # General insights and learnings
└── sources.md                # Source file tracking
```

## Indexing Workflow

### Step 1: Read Source Content

Read the source file(s) to index. Accept any markdown file — meeting notes, journals, scratch pads, brainstorm dumps. Read `.brain/config.md` to check `source_patterns` and `ignored_patterns` to determine which files are eligible for indexing.

### Step 2: Extract Agentic Metadata

Analyze the content and extract the following metadata fields. For detailed extraction patterns and heuristics, consult **`references/extraction-patterns.md`**.

**Required fields:**
- `title` — Descriptive title for the knowledge entry
- `date` — Date of the content (extracted or inferred)
- `type` — One of: `meeting`, `decision`, `action-item`, `insight`, `journal`
- `topics` — List of relevant topics
- `people` — List of people mentioned or involved
- `source` — Path to the original source file

**Relationship fields:**
- `action_items` — List of extracted action items with owner and deadline
- `decisions` — List of decisions with context and outcome
- `relationships` — People-to-topic, people-to-people connections
- `references` — Links to related knowledge entries
- `sentiment` — Overall tone (positive, neutral, negative, mixed)
- `priority` — Inferred urgency (high, medium, low)

### Step 3: Create Structured Knowledge File

Write the extracted knowledge as a markdown file with YAML frontmatter. Store in the appropriate subdirectory under `.brain/knowledge/`.

**File naming convention**: `YYYY-MM-DD-kebab-case-title.md`

**Template**:
```markdown
---
title: "1:1 with Alice - API Redesign Discussion"
date: 2026-01-26
type: meeting
topics: [api-redesign, backend, q2-planning]
people: [alice-chen, bob-smith]
source: ./notes/2026-01-26-alice-1on1.md
action_items:
  - task: "Draft API redesign proposal"
    owner: alice-chen
    deadline: 2026-02-01
    status: open
  - task: "Review current API usage metrics"
    owner: self
    deadline: 2026-01-30
    status: open
decisions:
  - decision: "Proceed with API v2 redesign"
    context: "Current API hitting rate limits, needs restructuring"
    alternatives: ["Patch existing API", "Add caching layer"]
    outcome: "Full redesign chosen for long-term scalability"
relationships:
  - from: alice-chen
    to: api-redesign
    type: owner
  - from: api-redesign
    to: q2-planning
    type: blocks
sentiment: positive
priority: high
---

# 1:1 with Alice - API Redesign Discussion

## Summary
[2-3 sentence summary of the knowledge entry]

## Key Points
- [Bullet points of main takeaways]

## Action Items
- [ ] Draft API redesign proposal (@alice-chen, due 2026-02-01)
- [ ] Review current API usage metrics (@self, due 2026-01-30)

## Decisions
- **Proceed with API v2 redesign**: Current API hitting rate limits. Chose full redesign over patching for long-term scalability.

## Context & Notes
[Additional context preserved from source]
```

### Step 4: Update Entity Files

After creating the knowledge file, update the entity registries:

**entities/people.md** — Add or update person entries with new relationships, mentions, and activity. See **`references/entity-schemas.md`** for the full schema.

**entities/projects.md** — Add or update project entries with status changes, ownership, and timeline updates.

**entities/topics.md** — Add new topics to the taxonomy or update existing topic relationships.

### Step 5: Update Master Index

Append the new knowledge entry to `.brain/index.md`. The index is organized entity-centrically:

```markdown
# Brain Index

## People
### Alice Chen
- [1:1 - API Redesign Discussion](knowledge/meetings/2026-01-26-1on1-alice-api-redesign.md) - 2026-01-26
- [Sprint Review](knowledge/meetings/2026-01-20-sprint-review.md) - 2026-01-20

## Projects
### API Redesign
- [Decision: Proceed with v2](knowledge/decisions/2026-01-26-api-v2-redesign.md) - 2026-01-26

## Topics
### Backend Architecture
- [API Redesign Discussion](knowledge/meetings/2026-01-26-1on1-alice-api-redesign.md)
```

### Step 6: Update Source Tracking

Record the indexed source in `.brain/sources.md` to prevent duplicate indexing:

```markdown
| Source | Indexed | Knowledge Files |
|--------|---------|-----------------|
| ./notes/2026-01-26-alice-1on1.md | 2026-01-26 | meetings/2026-01-26-1on1-alice-api-redesign.md |
```

## Indexing Best Practices

### Entity ID Conventions

Always use kebab-case for entity IDs: `alice-chen`, `api-redesign`, `q2-planning`. Maintain consistency across all entity files and knowledge entries.

### Resolving Ambiguity

When content is ambiguous:
- **Multiple people with same first name**: Use full name ID (`alice-chen` vs `alice-wong`)
- **Self-references**: Map "I", "me", "my" to `self` entity (configured alias in config.md)
- **Implicit actions**: Mark with `confidence: medium` or `confidence: low` in the action_items frontmatter
- **Uncertain dates**: Record both raw text and best interpretation: `deadline_raw: "sometime next week"`, `deadline: YYYY-MM-DD`

### Handling Re-indexing

When a source file has already been indexed (check `.brain/sources.md`):
1. Compare source content hash with stored hash
2. If unchanged, skip — inform that the file is already indexed and up to date
3. If changed, re-extract metadata and update the existing knowledge file(s)
4. Merge updated entity information (do not create duplicate entities)
5. Update the source tracking entry with new hash

### Single Source, Multiple Outputs

A single source file can produce multiple knowledge files. For example, a meeting note may generate:
- One file in `knowledge/meetings/` (the structured meeting note)
- One or more files in `knowledge/decisions/` (if significant decisions were made)
- One or more files in `knowledge/action-items/` (if standalone action tracking is needed)

Link these files together using the `references` frontmatter field.

### Confidence Scoring

Tag extracted metadata with confidence levels:
- **high**: Explicit language in the source ("TODO: draft proposal by Friday")
- **medium**: Clear intent but missing details ("She'll put something together")
- **low**: Inferred from context ("The discussion seemed to suggest...")

## Configuration

The `.brain/config.md` file controls indexing behavior:

```markdown
---
version: 0.1.0
auto_topics: true
default_type: insight
source_patterns:
  - "notes/**/*.md"
  - "meetings/**/*.md"
  - "journal/**/*.md"
  - "1on1/**/*.md"
ignored_patterns:
  - ".brain/**"
  - "node_modules/**"
  - ".git/**"
entity_aliases:
  self: "Phu Nguyen"
---
```

## Additional Resources

### Reference Files

For detailed patterns and schemas, consult:
- **`references/extraction-patterns.md`** — Heuristics for extracting action items, decisions, people, topics, and relationships from unstructured text
- **`references/entity-schemas.md`** — Full YAML schemas for people, projects, and topics entity files

### Example Files

Working examples in `examples/`:
- **`examples/raw-meeting-note.md`** — Sample unstructured meeting note (input)
- **`examples/indexed-meeting.md`** — Resulting structured knowledge file (output)
