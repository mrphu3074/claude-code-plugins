# Code Review Template

```xml
Conduct a code review for the following code.

<code language="{{LANGUAGE}}">
{{YOUR_CODE}}
</code>

<context>
Purpose: {{WHAT_THE_CODE_DOES}}
Part of: {{SYSTEM_OR_MODULE}}
</context>

<review-criteria>
1. Security vulnerabilities
2. Performance issues
3. Code quality and readability
4. Error handling
5. Best practices
</review-criteria>

<instructions>
1. Review against all criteria
2. Categorize by severity (Critical, Major, Minor, Suggestion)
3. Provide specific line references
4. Suggest fixes with code examples
</instructions>

<output-format>
<summary>
[Overall assessment]
</summary>

<issues>
<critical>[Security/correctness issues]</critical>
<major>[Significant problems]</major>
<minor>[Small improvements]</minor>
<suggestions>[Optional enhancements]</suggestions>
</issues>

<improved-code>
[Refactored version]
</improved-code>
</output-format>
```

## Usage
Replace `{{LANGUAGE}}` with python, javascript, go, etc.
Add your code and context information.
