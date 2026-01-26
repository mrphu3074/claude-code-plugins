---
description: View Brain knowledge base status and statistics
argument-hint: ""
---

Display the current status and statistics of the Brain knowledge base.

## Step 1: Check Brain Exists

Check if `.brain/` exists. If not, inform the user and suggest `/brain:init`.

## Step 2: Read Index Metadata

Read `.brain/index.md` frontmatter to get aggregate statistics:
- total_entries
- total_people
- total_projects
- total_topics
- last_updated

## Step 3: Gather Detailed Stats

Read additional files to compute detailed statistics:

- Count files in `.brain/knowledge/meetings/`
- Count files in `.brain/knowledge/decisions/`
- Count files in `.brain/knowledge/action-items/`
- Count files in `.brain/knowledge/insights/`
- Count entries in `.brain/sources.md`
- Read entity files for entity counts

For action items, grep for `status: open` to count open items.

## Step 4: Present Dashboard

Display a status dashboard:

```
Brain Status
============

Last updated: YYYY-MM-DD
Total entries: N

Knowledge Base:
  Meetings:     N entries
  Decisions:    N entries
  Action Items: N entries (M open)
  Insights:     N entries

Entities:
  People:   N tracked
  Projects: N tracked
  Topics:   N tracked

Sources:
  Indexed files: N

Recent Activity (last 5 entries):
  - YYYY-MM-DD: [Title] (type)
  - YYYY-MM-DD: [Title] (type)
  ...

Open Action Items (top 5 by deadline):
  - [ ] Task description (@owner, due YYYY-MM-DD)
  ...
```

## Step 5: Health Check

Report any issues:
- Unindexed files matching source_patterns in config
- Overdue action items
- Stale entries (no updates in 30+ days)
- Missing entity references (mentioned in knowledge but not in entity files)

## Step 6: Suggest Actions

Based on the status, suggest relevant actions:
- If unindexed files exist: "Found N unindexed files matching your source patterns. Run `/brain:index` to process them."
- If overdue action items: "You have N overdue action items. Want to review them?"
- If no recent activity: "No entries in the last 7 days. Any recent notes to index?"
