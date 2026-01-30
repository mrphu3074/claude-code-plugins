---
description: Add a journal entry for today (creates file if needed, appends with timestamp if exists)
argument-hint: [entry-content]
---

Add a journal entry to today's journal file. Uses GMT+7 timezone for dates and timestamps.

## Step 1: Validate Brain

Check that `.brain/` exists in the current project. If not, inform the user and suggest running `/brain:init` first.

## Step 2: Get Current Date and Time (GMT+7)

Calculate the current date and time in GMT+7 timezone:
- Use `TZ=Asia/Bangkok date` to get current time in GMT+7
- Verify the timezone offset is +07:00 (check with `date +%z` which should output +0700)
- Extract date as `YYYY-MM-DD` for filename
- Extract time as `h:mm AM/PM` format for entry timestamp (e.g., "2:30 PM", no leading zero for hours)
- Extract full date as "Month DD, YYYY" for title (e.g., "January 31, 2026")

## Step 3: Get Entry Content

Entry content: $ARGUMENTS

If no argument provided, ask the user what they want to journal using AskUserQuestion:
- Quick thought or reflection
- What they're working on
- A decision or realization
- Free-form entry

## Step 4: Ensure Journal Directory

Create `.brain/journal/` directory if it doesn't exist.

## Step 5: Check for Existing Journal

Check if `.brain/journal/journal-YYYY-MM-DD.md` exists for today's date.

## Step 6A: Create New Journal (if file doesn't exist)

If no journal exists for today, create a new file with:

```markdown
---
title: "Journal - [Full Date]"
date: YYYY-MM-DD
type: journal
timezone: GMT+7
entries: 1
---

# Journal - [Full Date]

## [Time in h:mm AM/PM format]

[Entry content]
```

## Step 6B: Append to Existing Journal (if file exists)

If journal already exists for today:

1. Read the existing file
2. Update the frontmatter `entries` count (increment by 1)
3. Append a new section at the end:

```markdown

## [Time in h:mm AM/PM format]

[Entry content]
```

## Step 7: Auto-Index Entry (Optional)

Attempt to use the brain-indexer agent to process the journal entry:
- Extract any action items mentioned
- Identify decisions made
- Detect people and topics referenced
- Update the master index and entity registries

**Note**: If auto-indexing fails or the brain-indexer agent is unavailable, the journal entry is still successfully saved. Inform the user they can manually index later with `/brain:index .brain/journal/`.

## Step 8: Confirm

Report to the user:
- Whether a new journal was created or entry was appended
- The timestamp of the entry
- What was indexed (action items, decisions, etc.) if any metadata was extracted
- Suggest they can use `/brain:recall` to search journal entries later
