# API & Data Processing Patterns

XML tag patterns for API integrations, data extraction, structured outputs, and data transformation tasks.

## Structured Output Extraction Pattern

```xml
Extract structured data from the following content.

<content>
{{UNSTRUCTURED_CONTENT}}
</content>

<output-schema>
{
  "field1": "description",
  "field2": "description",
  "nested": {
    "field3": "description"
  }
}
</output-schema>

<instructions>
1. Parse the content for relevant information
2. Map to the provided schema
3. Use null for missing fields
4. Validate data types
</instructions>

<output-format>
Provide response as valid JSON matching the schema.
Wrap output in <extracted-data> tags.
</output-format>
```

## API Response Processing Pattern

```xml
Process and transform this API response.

<api-response>
{{API_RESPONSE_JSON}}
</api-response>

<target-schema>
{{DESIRED_OUTPUT_SCHEMA}}
</target-schema>

<transformation-rules>
1. {{RULE_1}}
2. {{RULE_2}}
3. {{RULE_3}}
</transformation-rules>

<instructions>
1. Parse the API response
2. Apply transformation rules
3. Map to target schema
4. Handle missing or null values appropriately
</instructions>

<output-format>
<transformed-data>
[JSON matching target schema]
</transformed-data>
<transformation-notes>
[Any issues or assumptions made]
</transformation-notes>
</output-format>
```

## Data Validation Pattern

```xml
Validate the following data against the schema.

<data>
{{DATA_TO_VALIDATE}}
</data>

<schema>
{{VALIDATION_SCHEMA}}
</schema>

<validation-rules>
1. Required fields must be present
2. Data types must match
3. Values must be within constraints
4. {{CUSTOM_RULES}}
</validation-rules>

<instructions>
1. Check each field against schema
2. Validate data types
3. Apply custom validation rules
4. Report all validation errors
</instructions>

<output-format>
<validation-result>
  <valid>true/false</valid>
  <errors>
    <error>
      <field>field_name</field>
      <rule>violated_rule</rule>
      <message>description</message>
    </error>
  </errors>
</validation-result>
</output-format>
```

## Data Cleaning Pattern

```xml
Clean and normalize the following dataset.

<raw-data format="{{FORMAT}}">
{{RAW_DATA}}
</raw-data>

<cleaning-requirements>
1. Remove duplicates based on {{KEY_FIELDS}}
2. Standardize date formats to ISO 8601
3. Normalize text fields (trim, case)
4. Handle missing values: {{STRATEGY}}
5. {{ADDITIONAL_REQUIREMENTS}}
</cleaning-requirements>

<target-format>
{{DESIRED_FORMAT}}
</target-format>

<instructions>
1. Apply all cleaning requirements
2. Document changes made
3. Flag records that couldn't be cleaned
4. Output in target format
</instructions>

<output-format>
<cleaned-data>
[Cleaned dataset]
</cleaned-data>
<cleaning-report>
  <records-processed>N</records-processed>
  <duplicates-removed>N</duplicates-removed>
  <records-modified>N</records-modified>
  <records-flagged>N</records-flagged>
  <issues>
    [List of records with issues]
  </issues>
</cleaning-report>
</output-format>
```

## ETL Transformation Pattern

```xml
Transform data from source to target format.

<source-data format="{{SOURCE_FORMAT}}">
{{SOURCE_DATA}}
</source-data>

<source-schema>
{{SOURCE_SCHEMA}}
</source-schema>

<target-schema>
{{TARGET_SCHEMA}}
</target-schema>

<mapping-rules>
target_field_1: source_field_a
target_field_2: source_field_b + source_field_c
target_field_3: LOOKUP(source_field_d, mapping_table)
</mapping-rules>

<lookup-tables>
{{LOOKUP_DATA}}
</lookup-tables>

<instructions>
1. Parse source data
2. Apply mapping rules
3. Perform lookups as needed
4. Validate output against target schema
5. Report transformation statistics
</instructions>

<output-format>
<transformed-data format="{{TARGET_FORMAT}}">
[Transformed data]
</transformed-data>
<etl-stats>
  <input-records>N</input-records>
  <output-records>N</output-records>
  <failed-records>N</failed-records>
  <warnings>
    [List of transformation warnings]
  </warnings>
</etl-stats>
</output-format>
```

## API Integration Pattern

```xml
Generate code to integrate with {{API_NAME}}.

<api-documentation>
{{API_DOCS}}
</api-documentation>

<endpoints-needed>
1. {{ENDPOINT_1}}
2. {{ENDPOINT_2}}
</endpoints-needed>

<requirements>
Language: {{LANGUAGE}}
Auth method: {{AUTH_TYPE}}
Error handling: {{ERROR_STRATEGY}}
Rate limiting: {{RATE_LIMIT_HANDLING}}
</requirements>

<instructions>
1. Create client class/module
2. Implement authentication
3. Add methods for each endpoint
4. Include error handling
5. Add rate limiting logic
6. Include usage examples
</instructions>

<output-format>
<code language="{{LANGUAGE}}">
[Implementation code]
</code>
<usage-examples>
[Example code snippets]
</usage-examples>
<configuration>
[Required environment variables or config]
</configuration>
</output-format>
```

## Data Aggregation Pattern

```xml
Aggregate the following data according to specifications.

<data>
{{RAW_DATA}}
</data>

<aggregation-specs>
Group by: {{GROUP_FIELDS}}
Aggregations:
  - {{FIELD_1}}: {{AGG_FUNCTION_1}} (sum, avg, count, min, max)
  - {{FIELD_2}}: {{AGG_FUNCTION_2}}
</aggregation-specs>

<filters>
{{FILTER_CONDITIONS}}
</filters>

<instructions>
1. Apply filters to data
2. Group by specified fields
3. Calculate aggregations for each group
4. Sort results by {{SORT_FIELD}}
</instructions>

<output-format>
<aggregated-data>
[Aggregated results]
</aggregated-data>
<summary>
  <total-groups>N</total-groups>
  <records-processed>N</records-processed>
  <records-filtered>N</records-filtered>
</summary>
</output-format>
```

## Webhook Handler Pattern

```xml
Generate webhook handler for {{SERVICE}}.

<webhook-payload-examples>
{{EXAMPLE_PAYLOADS}}
</webhook-payload-examples>

<event-types>
1. {{EVENT_TYPE_1}}: {{DESCRIPTION}}
2. {{EVENT_TYPE_2}}: {{DESCRIPTION}}
</event-types>

<requirements>
Framework: {{FRAMEWORK}}
Validation: {{SIGNATURE_VALIDATION}}
Response requirements: {{RESPONSE_SPEC}}
</requirements>

<instructions>
1. Create webhook endpoint handler
2. Implement signature validation
3. Route events by type
4. Include error handling
5. Add logging
</instructions>

<output-format>
<code language="{{LANGUAGE}}">
[Handler implementation]
</code>
<testing-guide>
[How to test the webhook]
</testing-guide>
<security-notes>
[Security considerations]
</security-notes>
</output-format>
```

## Data Migration Pattern

```xml
Plan and generate data migration from {{SOURCE}} to {{TARGET}}.

<source-schema>
{{SOURCE_SCHEMA}}
</source-schema>

<target-schema>
{{TARGET_SCHEMA}}
</target-schema>

<sample-data>
{{SAMPLE_RECORDS}}
</sample-data>

<constraints>
- Maintain referential integrity
- Handle data type differences
- {{ADDITIONAL_CONSTRAINTS}}
</constraints>

<instructions>
1. Analyze schema differences
2. Create field mapping
3. Identify transformation needs
4. Generate migration script
5. Include rollback procedure
</instructions>

<output-format>
<migration-plan>
  <field-mapping>
    [Source to target field mapping]
  </field-mapping>
  <transformations>
    [Required data transformations]
  </transformations>
  <dependencies>
    [Order of table migrations]
  </dependencies>
</migration-plan>
<migration-script>
[Executable migration code]
</migration-script>
<rollback-script>
[Rollback procedure]
</rollback-script>
<validation-queries>
[Queries to verify migration]
</validation-queries>
</output-format>
```

## JSON Schema Generation Pattern

```xml
Generate JSON Schema for the following data structure.

<sample-data>
{{EXAMPLE_JSON}}
</sample-data>

<requirements>
- Schema version: {{DRAFT_VERSION}}
- Include descriptions
- Define required fields
- Add validation constraints
</requirements>

<additional-constraints>
{{FIELD_CONSTRAINTS}}
</additional-constraints>

<instructions>
1. Analyze data structure
2. Infer types and constraints
3. Add provided constraints
4. Include descriptions
5. Define required fields
</instructions>

<output-format>
<json-schema>
[Complete JSON Schema]
</json-schema>
<validation-examples>
  <valid-example>
    [Example that passes validation]
  </valid-example>
  <invalid-example>
    [Example that fails with explanation]
  </invalid-example>
</validation-examples>
</output-format>
```

## GraphQL Query Generation Pattern

```xml
Generate GraphQL queries for the following requirements.

<schema>
{{GRAPHQL_SCHEMA}}
</schema>

<requirements>
{{QUERY_REQUIREMENTS}}
</requirements>

<variables>
{{VARIABLE_DEFINITIONS}}
</variables>

<instructions>
1. Analyze schema for available types and fields
2. Create queries matching requirements
3. Include necessary fragments for reuse
4. Add variables for dynamic values
5. Include mutations if data changes needed
</instructions>

<output-format>
<queries>
[GraphQL query definitions]
</queries>
<mutations>
[GraphQL mutations if needed]
</mutations>
<fragments>
[Reusable fragments]
</fragments>
<usage-examples>
[Example variable values and expected results]
</usage-examples>
</output-format>
```

## Best Practices for API/Data Prompts

### Data Presentation
- Specify data format explicitly (`format="json"`, `format="csv"`)
- Include sample data when schema alone is ambiguous
- Use `<schema>` tags for structure definitions

### Processing Control
- Define clear transformation rules
- Specify handling for edge cases (nulls, missing values)
- Request processing statistics

### Output Requirements
- Specify exact output format needed
- Request validation results separately
- Include error/warning reporting

### Integration Context
- Provide API documentation or examples
- Specify authentication requirements
- Note rate limiting considerations
