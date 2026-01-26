---
name: Knowledge Retrieval
description: This skill should be used when the user asks to "recall", "remember", "search brain", "what did we discuss", "what were the action items", "who is working on", "find in my notes", "what decisions were made", "when did we talk about", "search my knowledge base", or when the user asks any question that could be answered from previously indexed knowledge in the .brain/ directory. Enables vectorless semantic retrieval through entity-centric tree index navigation.
version: 0.1.0
---

# Knowledge Retrieval

## Overview

Knowledge retrieval searches the `.brain/` directory to answer user queries using a **vectorless, reasoning-based approach**. Instead of vector similarity search, navigate the entity-centric tree index (`index.md`) and reason through the heading hierarchy to locate relevant knowledge — inspired by the PageIndex approach where LLMs reason over document structure rather than embedding similarity.

## Retrieval Strategy

### Step 1: Classify the Query

Determine the query type to choose the optimal search path:

| Query Type | Example | Primary Search Path |
|-----------|---------|---------------------|
| Person query | "What did Alice say about...?" | `index.md` → People → Alice Chen |
| Project query | "Status of the API redesign?" | `index.md` → Projects → API Redesign |
| Topic query | "What do we know about rate limiting?" | `index.md` → Topics → Rate Limiting |
| Action query | "What are my open action items?" | Grep across `knowledge/action-items/` + frontmatter |
| Decision query | "What was decided about X?" | `knowledge/decisions/` + `index.md` → relevant entity |
| Temporal query | "What happened last week?" | `index.md` → Timeline → target week |
| Relationship query | "Who works with Alice?" | `entities/people.md` → Alice → relationships |
| Cross-entity query | "How does X relate to Y?" | Multiple entity files + cross-references |

### Step 2: Navigate the Tree Index

Read `.brain/index.md` and navigate its heading hierarchy to find relevant entries:

1. **Scan top-level headings** (People, Projects, Topics, Timeline) to identify relevant sections
2. **Descend into matching sections** — read sub-headings for the target entity
3. **Collect candidate entries** — gather links to knowledge files that match the query
4. **Read candidate files** — load the most relevant knowledge files for detailed content

This tree-navigation approach avoids reading every file. The index structure acts as a table of contents that the LLM reasons through.

### Step 3: Entity Lookup (if needed)

For relationship or detailed entity queries, read the relevant entity file:

- `entities/people.md` — for person details, relationships, activity
- `entities/projects.md` — for project status, ownership, dependencies
- `entities/topics.md` — for topic taxonomy, related topics

### Step 4: Deep Read

Read the identified knowledge files to extract the answer. Each knowledge file has:

- **YAML frontmatter** — structured metadata for filtering
- **Summary section** — quick overview
- **Key Points** — bullet points of main takeaways
- **Action Items** — extracted tasks with owners and deadlines
- **Decisions** — extracted decisions with context
- **Context & Notes** — additional detail

For most queries, the frontmatter + summary is sufficient. Read deeper sections only when the query requires specific details.

### Step 5: Synthesize Answer

Compose the answer from retrieved knowledge. Always include:

1. **Direct answer** to the user's question
2. **Source references** — link to the knowledge file(s) used
3. **Related context** — mention related entities, decisions, or action items if relevant
4. **Confidence indicator** — note if the answer is based on explicit vs. inferred metadata

## Search Techniques

### Frontmatter Search

Use Grep to search YAML frontmatter across knowledge files:

```
# Find all entries mentioning a person
Grep for "alice-chen" in .brain/knowledge/**/*.md

# Find all open action items
Grep for "status: open" in .brain/knowledge/**/*.md

# Find entries by type
Grep for "type: decision" in .brain/knowledge/**/*.md

# Find entries by topic
Grep for "api-redesign" in .brain/knowledge/**/*.md

# Find entries by date range
Grep for "date: 2026-01" in .brain/knowledge/**/*.md
```

### Entity File Search

For relationship queries, search entity files directly:

```
# Find person relationships
Read .brain/entities/people.md, search for target person section

# Find project dependencies
Read .brain/entities/projects.md, search for dependency fields

# Find topic hierarchy
Read .brain/entities/topics.md, navigate heading structure
```

### Cross-Reference Navigation

Follow cross-references between entries:

1. Start with the primary entity match
2. Read its `relationships` and `references` frontmatter fields
3. Follow links to related knowledge files
4. Build a connected picture across multiple entries

### Full-Text Search (Fallback)

If index and entity searches don't yield results, fall back to full-text search:

```
# Search across all knowledge file content
Grep for "[query terms]" in .brain/knowledge/**/*.md

# Search source tracking for original files
Read .brain/sources.md to find related source files
```

## Query Patterns

### "What are my open action items?"
1. Grep for `status: open` across all knowledge files
2. Collect action items with owner `self`
3. Sort by deadline
4. Present as checklist with source links

### "What did [person] say about [topic]?"
1. Navigate `index.md` → People → [person]
2. Scan entries for [topic] relevance
3. Read matching knowledge files
4. Extract relevant quotes and context

### "What decisions have we made about [project]?"
1. Navigate `index.md` → Projects → [project]
2. Filter entries of type `decision`
3. Read each decision file
4. Present chronologically with context

### "Summarize everything about [topic]"
1. Navigate `index.md` → Topics → [topic]
2. Collect all related entries
3. Read entity files for people and projects connected to topic
4. Synthesize a comprehensive summary

### "What happened in [time period]?"
1. Navigate `index.md` → Timeline → [period]
2. List all entries chronologically
3. Group by type (meetings, decisions, actions)
4. Present as a timeline digest

## Response Format

Structure retrieval responses clearly:

```markdown
## [Answer to query]

[Direct answer with key information]

### Sources
- [Entry Title](path/to/knowledge-file.md) — date, type
- [Another Entry](path/to/another-file.md) — date, type

### Related
- **Open action items**: [if relevant]
- **Related decisions**: [if relevant]
- **Connected people**: [if relevant]
```

## Context Window Management

When the knowledge base is large, manage context efficiently:

1. **Start narrow**: Read `index.md` first — never read all knowledge files upfront
2. **Progressive loading**: Only read files that match the query classification
3. **Frontmatter first**: Read YAML frontmatter before full file content — frontmatter often contains enough metadata to answer or filter
4. **Cap at 5 files**: Read at most 5 knowledge files per query to prevent context overflow
5. **Stop when answered**: Once sufficient information is gathered, stop reading additional files

### Reading Priority Order
1. `.brain/index.md` — always read first (table of contents)
2. Entity files — read only if query involves entities
3. Knowledge files — read only the top matching candidates
4. Source files — read only as a last resort if knowledge files are insufficient

## Handling Temporal Queries

Resolve natural language time references before searching:

| Expression | Resolution |
|-----------|------------|
| "recently" | Last 7 days |
| "last week" | Previous Monday to Sunday |
| "this month" | Current calendar month |
| "last quarter" | Previous 3-month period |
| "a while ago" | Last 30 days |

Navigate `index.md` → Timeline section for chronological access. Group results by week for periods longer than 2 weeks, by day for shorter periods.

## Handling Missing Knowledge

When no matching knowledge is found:

1. State clearly that no indexed knowledge matches the query
2. Suggest indexing relevant source files using `/brain:index`
3. Check if the query might match a different entity name or alias (consult entity files for aliases)
4. Suggest broadening the search terms
5. If partial matches exist, present them with a note about incomplete coverage

## Additional Resources

### Reference Files

For advanced retrieval patterns, consult:
- **`references/search-strategies.md`** — Advanced multi-hop retrieval, fuzzy matching, and relevance scoring techniques

### Example Files

Working examples in `examples/`:
- **`examples/retrieval-scenarios.md`** — Sample queries with expected retrieval paths and results
