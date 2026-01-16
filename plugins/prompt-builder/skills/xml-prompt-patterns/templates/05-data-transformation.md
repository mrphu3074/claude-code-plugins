# Data Transformation Template

```xml
Transform data from source format to target format.

<source-data format="{{SOURCE_FORMAT}}">
{{SOURCE_DATA}}
</source-data>

<target-schema>
{{DESIRED_OUTPUT_STRUCTURE}}
</target-schema>

<transformation-rules>
1. {{RULE_1}}
2. {{RULE_2}}
3. Handle missing values: {{STRATEGY}}
</transformation-rules>

<instructions>
1. Parse source data
2. Apply transformation rules
3. Validate against target schema
4. Report any transformation issues
</instructions>

<output-format>
<transformed-data format="{{TARGET_FORMAT}}">
[Transformed output]
</transformed-data>

<transformation-report>
- Records processed: N
- Successful: N
- Failed: N
- Warnings: [List any issues]
</transformation-report>
</output-format>
```

## Usage
Supports CSV, JSON, XML, or any structured format.
Define clear transformation rules for reliable results.
