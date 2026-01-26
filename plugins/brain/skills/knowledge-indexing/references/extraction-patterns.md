# Agentic Metadata Extraction Patterns

Detailed heuristics for extracting structured metadata from unstructured text. These patterns guide the extraction process when indexing knowledge into the Brain.

## Action Item Extraction

### Explicit Patterns
Detect action items from direct language:
- "TODO:", "ACTION:", "TASK:", "FOLLOW-UP:"
- "[ ]" checkbox syntax
- "needs to", "should", "must", "will", "going to"
- "assigned to", "owned by", "responsible for"
- Imperative sentences directed at a person: "Alice, please review..."

### Implicit Patterns
Infer action items from context:
- Commitments: "I'll handle the deployment" → action item for self
- Requests: "Can someone look into the latency issue?" → action item (owner TBD)
- Expectations: "We expect the report by Friday" → action item with deadline
- Blockers: "This is blocked until the API is ready" → dependency + implicit action

### Extraction Template
```yaml
action_items:
  - task: "[verb phrase describing the action]"
    owner: "[person-id or 'self' or 'tbd']"
    deadline: "[YYYY-MM-DD or 'none']"
    status: "open"
    context: "[sentence from source that implies this action]"
    confidence: "[high|medium|low]"  # How confident the extraction is
```

### Confidence Scoring
- **High**: Explicit action language with clear owner and deadline
- **Medium**: Clear action but missing owner or deadline (inferred from context)
- **Low**: Implicit action inferred from discussion context

## Decision Extraction

### Explicit Patterns
- "We decided to...", "The decision is...", "Agreed to..."
- "Going with option...", "Chose to...", "Selected..."
- "Final answer:", "Verdict:", "Conclusion:"
- Voting outcomes: "Team voted 5-2 in favor of..."

### Implicit Patterns
- Direction shifts: "Instead of X, we'll do Y" → decision to change approach
- Prioritization: "This takes priority over..." → prioritization decision
- Resource allocation: "Alice will focus on..." → staffing decision
- Scope changes: "We're dropping feature X" → scope decision

### Extraction Template
```yaml
decisions:
  - decision: "[clear statement of what was decided]"
    context: "[background and reasoning]"
    alternatives: ["[option not chosen]", "[another option not chosen]"]
    outcome: "[why this option was chosen]"
    date: "[YYYY-MM-DD]"
    stakeholders: ["[person-ids involved]"]
    confidence: "[high|medium|low]"
```

## People Extraction

### Detection Patterns
- Proper nouns followed by action verbs
- @mentions or email addresses
- Role references: "the PM", "our designer", "the tech lead"
- Pronouns resolved through context: "She mentioned..." (resolve to named person)

### Relationship Inference
- **Reports-to**: "Alice's manager Bob", "reports to", "managed by"
- **Collaborates-with**: Co-mentioned in action items, shared projects
- **Owns**: "Alice owns the API redesign", "responsible for"
- **Blocks/Blocked-by**: "Waiting on Alice's review", dependency chains
- **Mentors/Mentored-by**: "Alice is mentoring Bob on..."

### Entity Resolution
Resolve different references to the same person:
- "Alice", "Alice Chen", "AC", "@alice" → `alice-chen`
- "the PM", "our product manager" → resolve to named person if mentioned
- "I", "me", "my" → `self` (configurable alias in config.md)

### People Entry Template
```yaml
# In entities/people.md
- id: alice-chen
  name: "Alice Chen"
  aliases: ["Alice", "AC", "@alice"]
  role: "Senior Backend Engineer"
  team: "Platform"
  relationships:
    - type: collaborates-with
      target: bob-smith
      context: "API redesign project"
    - type: reports-to
      target: carol-director
  first_seen: 2026-01-15
  last_seen: 2026-01-26
  mention_count: 12
```

## Topic Extraction

### Detection Patterns
- Recurring noun phrases across multiple entries
- Technical terms and project names
- Hashtags or explicit tags
- Meeting agenda items
- Section headers in notes

### Taxonomy Building
Organize topics hierarchically:
```
backend/
├── api-design/
│   ├── api-v2-redesign
│   └── rate-limiting
├── database/
│   ├── schema-migration
│   └── performance
└── deployment/
    ├── ci-cd
    └── infrastructure
```

### Topic Entry Template
```yaml
# In entities/topics.md
- id: api-redesign
  name: "API v2 Redesign"
  parent: api-design
  category: backend
  status: active
  related_topics: [rate-limiting, q2-planning]
  related_people: [alice-chen, bob-smith]
  first_mentioned: 2026-01-15
  last_mentioned: 2026-01-26
  mention_count: 8
```

## Relationship Extraction

### Cross-Entity Relationships
Map connections between all entity types:

| From | To | Relationship Types |
|------|----|--------------------|
| Person → Person | collaborates-with, reports-to, mentors, conflicts-with |
| Person → Project | owns, contributes-to, reviews, blocks |
| Person → Topic | expert-in, interested-in, assigned-to |
| Project → Project | depends-on, blocks, related-to |
| Project → Topic | categorized-as, addresses |
| Topic → Topic | parent-of, related-to, supersedes |

### Relationship Confidence
- **Explicit**: Stated directly in text ("Alice owns the API project")
- **Inferred**: Derived from co-occurrence and context
- **Temporal**: Changes over time (track with dates)

## Sentiment Analysis

### Detection Heuristics
- **Positive**: Progress language, agreement, enthusiasm, resolution
- **Negative**: Concerns, blockers, disagreements, frustration
- **Neutral**: Status updates, factual reporting
- **Mixed**: Contains both positive and negative elements

### Sentiment Template
```yaml
sentiment: mixed
sentiment_details:
  positive: ["Good progress on API design", "Team aligned on approach"]
  negative: ["Timeline concern for Q2", "Resource constraints"]
```

## Priority Inference

### High Priority Signals
- Explicit urgency: "urgent", "ASAP", "critical", "blocker"
- Short deadlines (within 1 week)
- Executive involvement or escalation
- Customer-facing impact mentioned

### Medium Priority Signals
- Standard deadlines (1-4 weeks)
- Regular project work
- Team-level decisions

### Low Priority Signals
- Long-term planning (months away)
- Nice-to-have items
- Exploratory or research tasks
- No deadline mentioned

## Date Extraction

### Explicit Dates
- ISO format: 2026-01-26
- Natural language: "January 26th", "next Friday", "end of Q2"
- Relative: "tomorrow", "next week", "in two weeks"

### Date Resolution
Resolve relative dates using the source file's date or current date:
- "next Friday" → calculate from source date
- "end of Q2" → 2026-06-30
- "by EOD" → source date
- "this sprint" → calculate based on sprint cadence if known

### Handling Ambiguity
When dates are ambiguous, record both the raw text and best interpretation:
```yaml
date_raw: "sometime next month"
date_resolved: "2026-02-15"
date_confidence: low
```
