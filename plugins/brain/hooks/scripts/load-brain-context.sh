#!/bin/bash

# Load Brain knowledge base context on session start.
# Checks if .brain/ exists in the project and outputs a summary
# for Claude's context awareness.

BRAIN_DIR="${CLAUDE_PROJECT_DIR:-.}/.brain"

# Check if Brain is initialized — exit silently if not
if [ ! -d "$BRAIN_DIR" ]; then
  exit 0
fi

INDEX_FILE="$BRAIN_DIR/index.md"
if [ ! -f "$INDEX_FILE" ]; then
  exit 0
fi

# Extract stats from index frontmatter (default to 0 if not found)
total_entries=$(grep -m1 "^total_entries:" "$INDEX_FILE" 2>/dev/null | sed 's/total_entries: *//' || true)
total_people=$(grep -m1 "^total_people:" "$INDEX_FILE" 2>/dev/null | sed 's/total_people: *//' || true)
total_projects=$(grep -m1 "^total_projects:" "$INDEX_FILE" 2>/dev/null | sed 's/total_projects: *//' || true)
total_topics=$(grep -m1 "^total_topics:" "$INDEX_FILE" 2>/dev/null | sed 's/total_topics: *//' || true)
last_updated=$(grep -m1 "^last_updated:" "$INDEX_FILE" 2>/dev/null | sed 's/last_updated: *//' || true)

total_entries="${total_entries:-0}"
total_people="${total_people:-0}"
total_projects="${total_projects:-0}"
total_topics="${total_topics:-0}"
last_updated="${last_updated:-unknown}"

# Count knowledge files per category
meetings_count=0
decisions_count=0
actions_count=0
insights_count=0

if [ -d "$BRAIN_DIR/knowledge/meetings" ]; then
  meetings_count=$(find "$BRAIN_DIR/knowledge/meetings" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
fi
if [ -d "$BRAIN_DIR/knowledge/decisions" ]; then
  decisions_count=$(find "$BRAIN_DIR/knowledge/decisions" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
fi
if [ -d "$BRAIN_DIR/knowledge/action-items" ]; then
  actions_count=$(find "$BRAIN_DIR/knowledge/action-items" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
fi
if [ -d "$BRAIN_DIR/knowledge/insights" ]; then
  insights_count=$(find "$BRAIN_DIR/knowledge/insights" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
fi

# Count open action items
open_actions=0
if [ -d "$BRAIN_DIR/knowledge" ]; then
  open_actions=$(grep -rl "status: open" "$BRAIN_DIR/knowledge/" 2>/dev/null | wc -l | tr -d ' ')
fi

# Output context for Claude
cat <<EOF
<brain-context>
Brain knowledge base detected at .brain/

Stats:
- Entries: $total_entries (meetings: $meetings_count, decisions: $decisions_count, action-items: $actions_count, insights: $insights_count)
- People: $total_people | Projects: $total_projects | Topics: $total_topics
- Open action items: $open_actions
- Last updated: $last_updated

The Brain knowledge base is available. Use the brain-retriever agent or /brain:recall to search indexed knowledge. Use the brain-indexer agent or /brain:index to add new knowledge.
</brain-context>
EOF
