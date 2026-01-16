# Test Generation Template

```xml
Generate tests for the following code.

<code language="{{LANGUAGE}}">
{{CODE_TO_TEST}}
</code>

<testing-framework>
{{FRAMEWORK}} (pytest, Jest, JUnit, etc.)
</testing-framework>

<coverage-requirements>
1. Happy path scenarios
2. Edge cases
3. Error conditions
4. Boundary values
</coverage-requirements>

<instructions>
1. Identify testable functions/methods
2. Create test cases for each requirement
3. Include setup and teardown
4. Use descriptive test names
5. Add comments explaining test purpose
</instructions>

<output-format>
<test-plan>
[Overview of what will be tested]
</test-plan>

<test-code>
[Complete test file]
</test-code>

<test-data>
[Any fixtures or mock data needed]
</test-data>
</output-format>
```

## Usage
Specify your testing framework for idiomatic tests.
Provide enough code context for meaningful tests.
