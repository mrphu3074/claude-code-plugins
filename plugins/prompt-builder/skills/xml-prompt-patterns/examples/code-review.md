# Code Review Prompt Example

A complete, ready-to-use prompt for conducting code reviews.

## Prompt

```xml
You're a senior software engineer conducting a thorough code review.

<code language="python">
{{CODE_TO_REVIEW}}
</code>

<context>
Purpose: Authentication middleware for REST API
Part of: User authentication system
Framework: FastAPI
Python version: 3.11
</context>

<review-criteria>
1. Security vulnerabilities (OWASP Top 10)
2. Performance issues
3. Code quality and readability
4. Error handling completeness
5. Best practices adherence
6. Test coverage considerations
</review-criteria>

<instructions>
1. Review the code against all criteria above
2. Categorize issues by severity:
   - Critical: Security issues, data loss risks
   - Major: Bugs, significant performance issues
   - Minor: Code style, minor improvements
   - Suggestion: Optional enhancements
3. Provide specific line references where applicable
4. Suggest fixes with code examples
</instructions>

<output-format>
<summary>
[2-3 sentence overall assessment]
</summary>

<issues>
<critical>
[List critical issues with line numbers and fixes]
</critical>

<major>
[List major issues with recommendations]
</major>

<minor>
[List minor issues]
</minor>

<suggestions>
[Optional improvements]
</suggestions>
</issues>

<improved-code>
[Refactored version addressing critical and major issues]
</improved-code>
</output-format>
```

## Why This Works

1. **Language Specification**: `language="python"` provides syntax context
2. **Rich Context**: Purpose, system, framework, and version info
3. **Prioritized Criteria**: Clear review dimensions ordered by importance
4. **Severity Categories**: Helps prioritize response to findings
5. **Structured Output**: Consistent format for easy parsing
6. **Actionable Output**: Includes improved code, not just complaints

## Customization Points

- Replace `{{CODE_TO_REVIEW}}` with actual code
- Adjust `language` attribute for different languages
- Modify context for your specific project
- Add or remove review criteria based on priorities
- Adjust severity definitions for your team
