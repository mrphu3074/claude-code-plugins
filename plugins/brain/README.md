# Brain - Local Knowledge Management for Claude Code

A local-first, agentic knowledge management plugin that transforms unstructured notes into structured, queryable knowledge — no vector database required.

## What it does

Brain indexes your markdown files (meeting notes, 1:1s, journals, brainstorms) by **automatically extracting metadata** — action items, decisions, people, topics, relationships — even when you didn't explicitly write them. This extracted knowledge is stored as structured markdown with YAML frontmatter in a `.brain/` directory, enabling fast retrieval through an entity-centric tree index.

**Core concepts:**
- **Agentic Metadata Extraction** — AI infers structure from unstructured content
- **Vectorless RAG** — Tree-structured index with LLM reasoning, no embeddings needed
- **Entity-Centric Organization** — Knowledge organized around People, Projects, and Topics
- **Git-Native** — Everything is plain markdown, fully version-controlled

## Installation

Add to your Claude Code plugins:

```bash
claude plugin add /path/to/brain
```

Or reference in your marketplace configuration.

## Quick Start

1. Initialize Brain in your project:
   ```
   /brain:init
   ```

2. Index a file:
   ```
   /brain:index ./notes/2026-01-26-alice-1on1.md
   ```

3. Recall knowledge:
   ```
   /brain:recall What did we decide about the API?
   ```

4. Check status:
   ```
   /brain:status
   ```

## Features

### Agentic Indexing

Brain doesn't just copy your notes — it **understands** them. From a raw meeting note like:

> "Alice mentioned the API needs a redesign before Q2 launch. She'll draft a proposal by Friday."

Brain extracts:
- **Action item**: Draft API redesign proposal (owner: Alice, deadline: Friday)
- **Decision**: API needs redesign before Q2 (implicit)
- **People**: Alice (role: proposal author)
- **Topic**: API redesign, Q2 planning
- **Relationship**: Alice → API redesign (owner)
- **Priority**: High (Q2 deadline mentioned)

### Proactive Agents

Brain includes two proactive agents:

- **brain-indexer** — Detects when you're working with meeting notes, 1:1s, or unstructured knowledge and suggests indexing
- **brain-retriever** — Activates when you ask questions that could be answered from your knowledge base

### Commands

| Command | Description |
|---------|-------------|
| `/brain:init` | Initialize `.brain/` directory in current project |
| `/brain:index [path]` | Index a file or directory into the knowledge base |
| `/brain:recall [query]` | Search and retrieve knowledge |
| `/brain:status` | View knowledge base stats and health |

### Session Context

On session start, Brain automatically loads a summary of your knowledge base into Claude's context, so it's aware of available knowledge without you needing to ask.

## .brain/ Directory Structure

```
.brain/
├── index.md              # Master tree index (heading hierarchy for retrieval)
├── config.md             # Brain configuration
├── sources.md            # Source file tracking
├── entities/
│   ├── people.md         # People registry + relationships
│   ├── projects.md       # Projects registry + status
│   └── topics.md         # Topic taxonomy
└── knowledge/
    ├── meetings/         # Structured meeting notes
    ├── decisions/        # Extracted decisions
    ├── action-items/     # Extracted action items
    └── insights/         # General insights and learnings
```

## Configuration

Edit `.brain/config.md` to customize:

```yaml
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
entity_aliases:
  self: "Your Name"
---
```

## How Retrieval Works

Brain uses a **vectorless, reasoning-based** approach inspired by [PageIndex](https://github.com/VectifyAI/PageIndex):

1. The master `index.md` organizes all knowledge as a tree of headings (People → Projects → Topics → Timeline)
2. Claude navigates this tree structure to find relevant sections
3. It reads matching knowledge files for detailed content
4. No embeddings, no vector database — just structured markdown and LLM reasoning

## Components

- **2 Skills**: knowledge-indexing, knowledge-retrieval
- **4 Commands**: init, index, recall, status
- **2 Agents**: brain-indexer (proactive), brain-retriever (proactive)
- **1 Hook**: SessionStart (loads brain context)
