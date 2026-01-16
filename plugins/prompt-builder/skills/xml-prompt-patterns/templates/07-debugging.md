# Debugging Template

```xml
Help debug the following issue.

<code language="{{LANGUAGE}}">
{{PROBLEMATIC_CODE}}
</code>

<error-info>
{{ERROR_MESSAGE_OR_UNEXPECTED_BEHAVIOR}}
</error-info>

<expected-behavior>
{{WHAT_SHOULD_HAPPEN}}
</expected-behavior>

<actual-behavior>
{{WHAT_ACTUALLY_HAPPENS}}
</actual-behavior>

<environment>
{{RUNTIME_DETAILS}}
</environment>

<instructions>
1. Analyze the code and error
2. Identify the root cause
3. Explain why the issue occurs
4. Provide a working fix
</instructions>

<output-format>
<root-cause>
[What's causing the issue]
</root-cause>

<explanation>
[Why this causes the problem]
</explanation>

<fix>
[Corrected code with comments]
</fix>

<prevention>
[How to prevent similar issues]
</prevention>
</output-format>
```

## Usage
Include the full error message or describe the unexpected behavior.
Provide environment details when relevant (versions, OS, etc.).
