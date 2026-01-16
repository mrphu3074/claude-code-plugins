# Output Format Patterns

Detailed patterns for requesting specific output formats in prompts.

## JSON Output Patterns

### Simple JSON
```xml
<output-format>
Respond with valid JSON only. No additional text.
{
  "result": "your answer here"
}
</output-format>
```

### Structured JSON with Schema
```xml
<output-schema>
{
  "summary": "string - brief overview",
  "items": [
    {
      "name": "string",
      "value": "number",
      "status": "string - one of: active, inactive, pending"
    }
  ],
  "metadata": {
    "total": "number",
    "processed": "number"
  }
}
</output-schema>

<instructions>
Return valid JSON matching the schema above.
Use null for missing optional fields.
Ensure all required fields are present.
</instructions>
```

### JSON with Type Hints
```xml
<output-format>
Return a JSON object with these fields:
- "success": boolean
- "data": array of objects
- "error": string or null
- "count": integer

Example:
{
  "success": true,
  "data": [{"id": 1, "name": "example"}],
  "error": null,
  "count": 1
}
</output-format>
```

## XML Output Patterns

### Simple XML
```xml
<output-format>
Structure your response as XML:
<result>
  <status>success|failure</status>
  <message>your response</message>
</result>
</output-format>
```

### Nested XML with Attributes
```xml
<output-format>
Return XML with this structure:
<report type="analysis" date="YYYY-MM-DD">
  <summary>Brief overview</summary>
  <findings>
    <finding severity="high|medium|low">
      <description>Issue description</description>
      <recommendation>Suggested action</recommendation>
    </finding>
  </findings>
</report>
</output-format>
```

### XML with Namespace
```xml
<output-format>
Return XML with proper namespace:
<?xml version="1.0" encoding="UTF-8"?>
<response xmlns="http://example.com/schema">
  <data>
    <item id="1">Content</item>
  </data>
</response>
</output-format>
```

## Markdown Output Patterns

### Structured Markdown
```xml
<output-format>
Format as Markdown:

## Summary
[2-3 sentence overview]

## Key Findings
- Finding 1
- Finding 2

## Details
[Detailed analysis with subheadings as needed]

## Recommendations
1. First recommendation
2. Second recommendation
</output-format>
```

### Markdown with Code Blocks
```xml
<output-format>
Use Markdown with:
- Fenced code blocks with language tags
- Inline code for short references
- Headers for organization

Example structure:
## Analysis
The function `processData()` has issues.

```python
# Fixed code here
```

## Next Steps
...
</output-format>
```

### Markdown Table Output
```xml
<output-format>
Present results as a Markdown table:

| Column 1 | Column 2 | Column 3 |
|----------|----------|----------|
| Value    | Value    | Value    |

Include a brief summary before the table.
</output-format>
```

## YAML Output Patterns

### Simple YAML
```xml
<output-format>
Return valid YAML:
result:
  status: success
  message: "your response"
  items:
    - item1
    - item2
</output-format>
```

### YAML Configuration Style
```xml
<output-format>
Format as YAML configuration:
config:
  name: "value"
  settings:
    enabled: true
    level: 3
  features:
    - feature1
    - feature2
</output-format>
```

## CSV Output Patterns

### Simple CSV
```xml
<output-format>
Return data as CSV:
header1,header2,header3
value1,value2,value3
value4,value5,value6

Use quotes for values containing commas.
</output-format>
```

### CSV with Specific Columns
```xml
<output-format>
Return CSV with these columns:
id,name,status,value,notes

Rules:
- Use double quotes for text with commas
- Use ISO 8601 for dates (YYYY-MM-DD)
- Leave empty for null values
</output-format>
```

## Plain Text Patterns

### Structured Plain Text
```xml
<output-format>
Provide a plain text response with clear sections:

SUMMARY
[Overview paragraph]

FINDINGS
* Finding 1
* Finding 2

RECOMMENDATIONS
1. First recommendation
2. Second recommendation
</output-format>
```

### Conversational Plain Text
```xml
<output-format>
Respond in plain conversational text.
Keep paragraphs short and clear.
No special formatting required.
</output-format>
```

## Hybrid Formats

### Markdown with Embedded JSON
```xml
<output-format>
Provide analysis in Markdown, with data as JSON code block:

## Analysis
[Your analysis here]

## Data
```json
{
  "key": "value"
}
```
</output-format>
```

### Text with Structured Section
```xml
<output-format>
Provide explanation in plain text, followed by structured data:

EXPLANATION:
[Your explanation here]

DATA:
```json
{"structured": "data"}
```
</output-format>
```

## Format Selection Guide

### Choose JSON when:
- Output will be parsed programmatically
- Building API integrations
- Need strict structure validation
- Data will be stored in databases

### Choose XML when:
- Working with enterprise systems
- Need attributes on elements
- Document-oriented data
- XSLT transformations planned

### Choose Markdown when:
- Output is for human reading
- Will be rendered in documentation
- Need mixed content (text, code, tables)
- Creating reports or summaries

### Choose YAML when:
- Creating configuration files
- Need human-readable structured data
- Working with DevOps tooling
- Prefer minimal syntax

### Choose CSV when:
- Exporting to spreadsheets
- Simple tabular data
- Large datasets
- Database import/export

### Choose Plain Text when:
- Simple responses needed
- No parsing required
- Conversational context
- Email or message content

## Validation Instructions

Add validation requirements to output format:

```xml
<output-format>
Return valid JSON.
<validation>
- Must be parseable by JSON.parse()
- All required fields must be present
- Arrays must have at least one element
- Strings must not be empty
</validation>
</output-format>
```

## Error Handling in Output

Request error information in structured output:

```xml
<output-format>
Return JSON with error handling:
{
  "success": boolean,
  "data": {} or null,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message",
    "details": {}
  } or null
}
</output-format>
```
