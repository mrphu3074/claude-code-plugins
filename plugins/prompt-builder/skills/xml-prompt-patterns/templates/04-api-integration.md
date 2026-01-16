# API Integration Template

```xml
Generate code to integrate with {{API_NAME}}.

<api-documentation>
{{API_DOCS_OR_EXAMPLES}}
</api-documentation>

<endpoints>
1. {{ENDPOINT_1}}: {{DESCRIPTION}}
2. {{ENDPOINT_2}}: {{DESCRIPTION}}
</endpoints>

<requirements>
Language: {{PROGRAMMING_LANGUAGE}}
Auth method: {{API_KEY|OAUTH|BEARER}}
Error handling: Required
</requirements>

<instructions>
1. Create client class/module
2. Implement authentication
3. Add methods for each endpoint
4. Include error handling
5. Add usage examples
</instructions>

<output-format>
<code language="{{LANGUAGE}}">
[Complete implementation]
</code>

<usage-examples>
[How to use the client]
</usage-examples>

<configuration>
[Required env vars or config]
</configuration>
</output-format>
```

## Usage
Provide API documentation or example requests/responses.
Specify your preferred programming language.
