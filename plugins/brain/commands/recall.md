---
description: Search and recall knowledge from the Brain knowledge base
argument-hint: [search-query]
---

Search the Brain knowledge base to answer a query using vectorless, reasoning-based retrieval.

## Step 1: Validate Brain

Check that `.brain/` exists and has indexed content. If not initialized, suggest `/brain:init`. If initialized but empty, suggest `/brain:index`.

## Step 2: Parse Query

Query: $ARGUMENTS

If no query provided, ask the user what they want to recall using AskUserQuestion:
- Free-text search query
- Common shortcuts:
  - "action items" — show open action items assigned to self
  - "recent" — show last 5 indexed entries
  - "people" — list all known people
  - "projects" — list all known projects

## Step 3: Classify Query Type

Determine the query type to choose the optimal search path. Use the knowledge-retrieval skill for classification:

| Query Type | Indicators | Search Path |
|-----------|------------|-------------|
| Person | Names, "who" | index.md → People, entities/people.md |
| Project | Project names, "status of" | index.md → Projects, entities/projects.md |
| Topic | Technical terms, "about" | index.md → Topics, entities/topics.md |
| Action | "action items", "tasks", "todo" | Grep frontmatter across knowledge files |
| Decision | "decided", "decision", "chose" | knowledge/decisions/ + index |
| Temporal | "last week", "recently", dates | index.md → Timeline |
| Relationship | "works with", "reports to" | Entity files → relationships |
| Cross-entity | "how does X affect Y" | Multi-hop across entities |

## Step 4: Execute Retrieval

Follow the retrieval strategy from the knowledge-retrieval skill:

1. Read `.brain/index.md` — navigate heading hierarchy to find relevant sections
2. Read entity files if query involves people, projects, or topics
3. Read the top matching knowledge files (frontmatter first, then full content if needed)
4. For action item queries, grep across all knowledge files for `status: open`
5. Follow cross-references for multi-hop queries

Limit to reading at most 5 knowledge files to manage context.

## Step 5: Synthesize and Present

Format the response clearly:

1. **Direct answer** to the query
2. **Supporting details** from knowledge entries
3. **Source links** — reference the knowledge files used
4. **Related items** — mention connected entities, open actions, or pending decisions if relevant

If no results found:
- State clearly that no matching knowledge was found
- Suggest indexing relevant files
- Suggest alternative search terms based on known entities

## Step 6: Suggest Follow-ups

After presenting results, suggest related queries the user might find useful:
- "Would you also like to see [related topic]?"
- "There are [N] open action items related to this — want to see them?"
- "This connects to [related project] — want details?"
