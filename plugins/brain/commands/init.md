---
description: Initialize the Brain knowledge base in the current project
argument-hint: ""
---

Initialize a `.brain/` directory in the current project for local knowledge management.

## Step 1: Check Existing Brain

Check if `.brain/` already exists in the current working directory.

- If it exists, inform the user and show current stats (number of indexed files, entities, etc.)
- If it does not exist, proceed to creation

## Step 2: Create Directory Structure

Create the following directory structure:

```
.brain/
├── index.md
├── config.md
├── sources.md
├── entities/
│   ├── people.md
│   ├── projects.md
│   └── topics.md
└── knowledge/
    ├── meetings/
    ├── decisions/
    ├── action-items/
    └── insights/
```

## Step 3: Create Config File

Write `.brain/config.md` with default configuration:

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
  - "docs/**/*.md"
ignored_patterns:
  - ".brain/**"
  - "node_modules/**"
  - ".git/**"
  - "dist/**"
  - "build/**"
entity_aliases:
  self: "User"
---

# Brain Configuration

Adjust the settings above to customize Brain behavior for this project.

- **source_patterns**: Glob patterns for files Brain should consider for indexing
- **ignored_patterns**: Glob patterns for files Brain should never index
- **entity_aliases**: Map aliases to canonical names (e.g., "self" → your name)
- **auto_topics**: Automatically create topic entries when new topics are detected
- **default_type**: Default knowledge type when type cannot be inferred
```

## Step 4: Create Empty Index

Write `.brain/index.md`:

```markdown
---
version: 0.1.0
last_updated: [today's date]
total_entries: 0
total_people: 0
total_projects: 0
total_topics: 0
---

# Brain Index

## People

_No people indexed yet. Use `/brain:index` to index knowledge files._

## Projects

_No projects indexed yet._

## Topics

_No topics indexed yet._

## Timeline

_No entries yet._
```

## Step 5: Create Empty Entity Files

Create each entity file with initial empty structure and YAML frontmatter with `version: 0.1.0` and `last_updated: [today's date]`.

## Step 6: Create Sources Tracking

Write `.brain/sources.md` with empty tracking table:

```markdown
---
version: 0.1.0
---

# Indexed Sources

| Source Path | Indexed Date | Hash | Knowledge Files |
|-------------|-------------|------|-----------------|
```

## Step 7: Confirm

Report to the user:
- Brain initialized at `.brain/`
- Number of directories and files created
- Suggest next steps: "Use `/brain:index [file-or-directory]` to start indexing knowledge, or just work normally — I'll suggest indexing when I detect unstructured knowledge files."
- Mention they can customize `.brain/config.md` (especially `entity_aliases.self`)
