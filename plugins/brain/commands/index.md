---
description: Index a file or directory into the Brain knowledge base
argument-hint: [file-or-directory-path]
---

Index one or more files into the Brain knowledge base by extracting agentic metadata and storing structured knowledge.

## Step 1: Validate Brain

Check that `.brain/` exists in the current project. If not, inform the user and suggest running `/brain:init` first.

## Step 2: Resolve Target

Target path: $ARGUMENTS

- If a file path is provided, index that single file
- If a directory path is provided, discover all markdown files matching the source patterns from `.brain/config.md`
- If no argument provided, ask the user what to index using AskUserQuestion:
  - A specific file path
  - A directory to scan
  - Auto-detect: scan for files matching `source_patterns` in config that haven't been indexed yet

## Step 3: Check Source Tracking

Read `.brain/sources.md` and check if the target file(s) have already been indexed.

- If already indexed, check if the file content has changed (compare with stored hash)
- If unchanged, inform the user the file is already indexed and up to date
- If changed, proceed with re-indexing and note this is an update

## Step 4: Read Source Files

Read each source file to index. For each file, use the knowledge-indexing skill to:

1. Extract agentic metadata (action items, decisions, people, topics, relationships, sentiment, priority)
2. Infer metadata even when not explicitly written
3. Resolve entity references against existing entities in `.brain/entities/`

## Step 5: Create Knowledge Files

For each source file, create structured knowledge file(s) in the appropriate `.brain/knowledge/` subdirectory:

- **meetings/** — if content is a meeting note, 1:1, standup, retrospective
- **decisions/** — if content contains significant decisions (can also extract from meetings)
- **action-items/** — if content contains action items (can also extract from meetings)
- **insights/** — for general knowledge, learnings, observations

Use YAML frontmatter format with all extracted metadata. Follow the template from the knowledge-indexing skill.

A single source file may produce multiple knowledge files (e.g., a meeting note produces a meeting entry plus separate decision and action-item entries).

## Step 6: Update Entities

Update the entity registry files:

- `.brain/entities/people.md` — add or update people mentioned
- `.brain/entities/projects.md` — add or update projects referenced
- `.brain/entities/topics.md` — add or update topics detected

When updating existing entities, merge new information with existing data. Increment mention counts, update `last_seen` dates, add new relationships.

## Step 7: Update Master Index

Append new entries to `.brain/index.md` under the appropriate entity sections (People, Projects, Topics, Timeline). Maintain the entity-centric organization and chronological ordering within each entity.

Update the frontmatter counters (total_entries, total_people, total_projects, total_topics).

## Step 8: Update Source Tracking

Record the indexed source in `.brain/sources.md` with:
- Source path
- Indexed date
- Content hash (first 6 chars of a simple hash for change detection)
- Generated knowledge file paths

## Step 9: Report

Present a summary to the user:

```
Indexed: [filename]

Extracted:
- [N] action items ([M] with deadlines)
- [N] decisions
- [N] people ([M] new, [K] updated)
- [N] topics ([M] new)
- [N] relationships

Knowledge files created:
- .brain/knowledge/meetings/YYYY-MM-DD-title.md
- .brain/knowledge/decisions/YYYY-MM-DD-title.md

Entities updated: [list of updated entity names]
```

If multiple files were indexed, show aggregate stats and list each file processed.
