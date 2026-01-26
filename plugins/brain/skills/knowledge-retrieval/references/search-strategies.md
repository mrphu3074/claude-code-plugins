# Advanced Search Strategies

Advanced retrieval techniques for complex queries against the Brain knowledge base.

## Multi-Hop Retrieval

For queries requiring information from multiple connected entries:

### Strategy
1. **First hop**: Find the primary entity matching the query
2. **Second hop**: Follow relationships and cross-references to connected entries
3. **Third hop**: If needed, follow further links from the second-hop results
4. **Synthesize**: Combine information across all hops

### Example: "How does Alice's work affect the Q2 timeline?"
1. **Hop 1**: Find Alice in `entities/people.md` → get her projects and action items
2. **Hop 2**: Read each project → find dependencies, especially ones touching Q2
3. **Hop 3**: Read Q2-related decision entries → find timeline impacts
4. **Synthesize**: Connect Alice's work → project dependencies → Q2 impact

### Multi-Hop Limits
- Maximum 3 hops to prevent context overload
- At each hop, select the top 3 most relevant entries
- If still inconclusive after 3 hops, report partial findings

## Fuzzy Entity Matching

When the user's query doesn't exactly match entity names:

### Alias Resolution
Check `entities/people.md` for aliases:
- "Al" → might be "Alice Chen" (alias: Al, Alice, AC)
- "the API thing" → search topics for "api" substring
- "last week's meeting" → resolve to date range, search Timeline section

### Partial Matching
- Break query into keywords
- Search each keyword against index headings
- Score matches by keyword overlap
- Return top 3 matches

### Phonetic / Typo Tolerance
- "Alise" → probably "Alice" (edit distance 1)
- "API redisign" → probably "API Redesign" (common typo)
- Rely on Grep's case-insensitive search for flexibility

## Relevance Scoring

When multiple entries match, rank by relevance:

### Scoring Factors

| Factor | Weight | Description |
|--------|--------|-------------|
| Entity match | 5 | Direct entity name match in query |
| Topic match | 4 | Query terms match entry topics |
| Recency | 3 | More recent entries score higher |
| Type match | 3 | Entry type matches query intent |
| Mention count | 2 | More-mentioned entities likely more relevant |
| Priority | 2 | High-priority entries score higher |
| Relationship depth | 1 | Direct relationships score higher than transitive |

### Scoring Algorithm
```
score = (entity_match * 5) + (topic_match * 4) + (recency * 3) +
        (type_match * 3) + (mention_weight * 2) + (priority * 2) +
        (relationship_depth * 1)
```

Return entries sorted by score, top 5 results.

## Temporal Reasoning

### Relative Date Resolution
Resolve natural language time references:
- "recently" → last 7 days
- "last week" → previous Monday to Sunday
- "this month" → current calendar month
- "last quarter" → previous 3-month period
- "a while ago" → last 30 days

### Timeline Queries
For "what happened between X and Y":
1. Navigate `index.md` → Timeline section
2. Identify entries within the date range
3. Group by week for periods > 2 weeks
4. Group by day for periods <= 2 weeks

### Trend Detection
For "how has [topic] evolved":
1. Collect all entries for the topic, sorted chronologically
2. Track changes in sentiment, priority, and action item status
3. Identify inflection points (decisions, status changes)
4. Summarize the progression

## Aggregation Queries

### "How many open action items do I have?"
1. Grep across all knowledge files for `status: open`
2. Filter for `owner: self`
3. Count and categorize by project/topic
4. Sort by deadline proximity

### "Who have I met with most often?"
1. Read `entities/people.md`
2. Sort by mention count
3. Filter for entries of type `meeting`
4. Return top 5 with meeting counts

### "What are the most active projects?"
1. Read `entities/projects.md`
2. Count recent entries per project (last 30 days)
3. Factor in open action items and pending decisions
4. Rank by activity score

## Negative Queries

### "What have we NOT decided about [topic]?"
1. Find all entries related to [topic]
2. Identify mentioned but unresolved items
3. Look for action items without decisions
4. Highlight open questions from meeting notes

### "What's missing from [project]?"
1. Read project entity for dependencies and action items
2. Identify overdue or TBD items
3. Check for missing roles (no owner, no reviewer)
4. Report gaps

## Context Window Management

### For Large Knowledge Bases
When `.brain/` grows large, manage context efficiently:

1. **Start narrow**: Read index.md first, not individual files
2. **Progressive loading**: Only read files that match the query
3. **Frontmatter first**: Read YAML frontmatter before full file content
4. **Summarize early**: After reading 3-5 files, check if the answer is sufficient
5. **Stop when answered**: Don't read additional files once the query is resolved

### File Reading Priority
1. `index.md` — always read first (table of contents)
2. Entity files — read if query involves entities
3. Knowledge files — read only the most relevant matches
4. Source files — read only if knowledge files are insufficient
