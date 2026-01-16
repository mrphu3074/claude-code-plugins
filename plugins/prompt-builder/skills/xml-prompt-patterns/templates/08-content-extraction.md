# Content Extraction Template

```xml
Extract structured data from the following content.

<content>
{{UNSTRUCTURED_CONTENT}}
</content>

<output-schema>
{
  "field1": "description of what to extract",
  "field2": "description of what to extract",
  "items": [
    {
      "name": "description",
      "value": "description"
    }
  ]
}
</output-schema>

<instructions>
1. Parse the content for relevant information
2. Map extracted data to the schema
3. Use null for fields that can't be found
4. Ensure data types match schema
</instructions>

<output-format>
<extracted-data>
[JSON matching the output schema]
</extracted-data>

<extraction-notes>
[Any ambiguities or assumptions made]
</extraction-notes>
</output-format>
```

## Usage
Define your output schema to match your data needs.
Works with text, HTML, emails, documents, etc.
