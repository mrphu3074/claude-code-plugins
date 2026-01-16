---
name: XML Prompt Patterns
description: This skill should be used when the user asks to "build a prompt", "structure a prompt", "add XML tags to prompt", "improve prompt structure", "create structured prompt", "use XML tags", "format prompt with tags", or needs guidance on Anthropic XML tag best practices for prompt engineering.
version: 1.0.0
---

# XML Prompt Patterns

Structure prompts using XML tags to improve clarity, accuracy, flexibility, and parseability. XML tags help Claude parse prompts more accurately, leading to higher-quality outputs.

## Core Benefits

1. **Clarity** - Separate different parts of prompts (context, instructions, examples)
2. **Accuracy** - Reduce errors from Claude misinterpreting prompt parts
3. **Flexibility** - Easy to modify prompts without rewriting everything
4. **Parseability** - Easier to extract specific parts of outputs by post-processing

## Essential Tag Patterns

### Structural Tags

| Tag | Purpose | Example Use |
|-----|---------|-------------|
| `<context>` | Background information | Company details, user profile |
| `<instructions>` | What to do | Step-by-step tasks |
| `<input>` | User-provided data | Text to analyze, code to review |
| `<output>` | Expected format | Structured response template |
| `<constraints>` | Limitations/rules | Word limits, format requirements |

### Content Tags

| Tag | Purpose | Example Use |
|-----|---------|-------------|
| `<example>` | Sample input/output | Few-shot demonstrations |
| `<data>` | Raw data to process | CSV, JSON, spreadsheet content |
| `<document>` | Full document text | Contract, report, article |
| `<code>` | Source code | Code to review or modify |
| `<schema>` | Data structure | API response format, DB schema |

### Output Control Tags

| Tag | Purpose | Example Use |
|-----|---------|-------------|
| `<thinking>` | Reasoning process | Chain of thought |
| `<answer>` | Final response | Extracted conclusion |
| `<findings>` | Analysis results | Audit findings, issues found |
| `<recommendations>` | Suggested actions | Next steps, improvements |

## Tag Best Practices

### Naming Conventions

- Use semantic names that describe content (`<contract>` not `<text1>`)
- Keep names lowercase with hyphens for multi-word (`<user-profile>`)
- Be consistent throughout the prompt
- Match tag names to their purpose

### Nesting Strategy

Nest tags for hierarchical content:

```xml
<examples>
  <example type="positive">
    <input>Sample input</input>
    <output>Expected output</output>
  </example>
  <example type="negative">
    <input>Bad input</input>
    <output>Why this fails</output>
  </example>
</examples>
```

### Referencing Tags

Reference tag names when giving instructions:

```
Using the contract in <contract> tags, analyze the following clauses...
Based on the data in <spreadsheet>, generate a report...
```

## Prompt Structure Template

Standard structured prompt format:

```xml
[Role/persona description]

<context>
Background information about the task, company, or domain
</context>

<input>
{{USER_DATA}}
</input>

<instructions>
1. First task to perform
2. Second task to perform
3. Third task to perform
</instructions>

<constraints>
- Constraint 1
- Constraint 2
</constraints>

<output-format>
Description of expected output structure
</output-format>
```

## Common Patterns by Category

### Analysis Pattern

```xml
<document>
{{DOCUMENT_TO_ANALYZE}}
</document>

<instructions>
1. Analyze for [specific aspects]
2. Identify [key elements]
3. Summarize findings in <findings> tags
4. Provide recommendations in <recommendations> tags
</instructions>
```

### Code Review Pattern

```xml
<code language="python">
{{CODE_TO_REVIEW}}
</code>

<review-criteria>
- Security vulnerabilities
- Performance issues
- Code quality
- Best practices
</review-criteria>

<instructions>
Review the code and provide:
1. Issues found in <issues> tags
2. Suggestions in <suggestions> tags
3. Improved code in <improved-code> tags
</instructions>
```

### Data Processing Pattern

```xml
<data format="csv">
{{RAW_DATA}}
</data>

<schema>
Expected output structure
</schema>

<instructions>
Transform the data according to the schema.
Output result in <result> tags.
</instructions>
```

## Output Format Tags

Request structured outputs for easier parsing:

```xml
<instructions>
Provide your response using these tags:
- <summary> - Brief overview
- <analysis> - Detailed analysis
- <action-items> - Recommended next steps
</instructions>
```

## Output Format Selection

When building prompts, always ask users to choose their preferred output format:

### Available Output Formats

| Format | Best For | Parseability |
|--------|----------|--------------|
| **JSON** | API integration, programmatic parsing | Excellent |
| **XML** | Structured documents, nested data | Excellent |
| **Markdown** | Human-readable reports, documentation | Good |
| **Plain Text** | Simple responses, conversational | Basic |
| **YAML** | Configuration, readable structured data | Good |
| **CSV** | Tabular data, spreadsheet export | Good |

### Format-Specific Instructions

**JSON Output:**
```xml
<output-format>
Respond with valid JSON matching this schema:
{
  "field1": "type",
  "field2": "type"
}
Do not include any text outside the JSON.
</output-format>
```

**XML Output:**
```xml
<output-format>
Structure your response as XML:
<response>
  <field1>value</field1>
  <field2>value</field2>
</response>
</output-format>
```

**Markdown Output:**
```xml
<output-format>
Format response as Markdown with:
- Headers for sections (##)
- Bullet points for lists
- Code blocks for code
- Tables where appropriate
</output-format>
```

**Plain Text Output:**
```xml
<output-format>
Provide a plain text response.
Use clear paragraphs and simple formatting.
No special markup or structure required.
</output-format>
```

For detailed output format patterns, see `references/output-formats.md`.

## Combining with Prompting Techniques

### With Chain of Thought

```xml
<instructions>
Think through this step by step.
Show reasoning in <thinking> tags.
Provide final answer in <answer> tags.
</instructions>
```

### With Few-Shot Examples

```xml
<examples>
  <example>
    <input>Example input 1</input>
    <output>Example output 1</output>
  </example>
  <example>
    <input>Example input 2</input>
    <output>Example output 2</output>
  </example>
</examples>

<input>
{{ACTUAL_INPUT}}
</input>
```

## File Save Location

Save generated prompts to `./prompts/` directory:
- Use descriptive filenames: `api-analysis-prompt.md`, `code-review-template.md`
- Include metadata comments at top of file
- Create directory if it doesn't exist

## Additional Resources

### Reference Files

For detailed patterns by domain:
- **`references/analysis-patterns.md`** - Financial, data, and business analysis patterns
- **`references/code-patterns.md`** - Code review, debugging, and documentation patterns
- **`references/legal-patterns.md`** - Contract and document analysis patterns
- **`references/api-patterns.md`** - API integration and data processing patterns

### Template Files

Pre-built templates in `templates/`:
- Browse available templates for common use cases
- Copy and customize for specific needs

### Example Files

Working examples in `examples/`:
- **`financial-report.md`** - Financial analysis prompt
- **`code-review.md`** - Code review prompt
- **`contract-analysis.md`** - Legal document analysis
