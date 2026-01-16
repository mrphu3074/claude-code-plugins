# Code & Development Patterns

XML tag patterns for code review, debugging, refactoring, and documentation tasks.

## Code Review Pattern

```xml
You're a senior software engineer conducting a code review.

<code language="{{LANGUAGE}}">
{{CODE_TO_REVIEW}}
</code>

<context>
Purpose: {{PURPOSE}}
Part of: {{SYSTEM/MODULE}}
Author experience level: {{LEVEL}}
</context>

<review-criteria>
1. Security vulnerabilities
2. Performance issues
3. Code quality and readability
4. Best practices adherence
5. Error handling
6. Test coverage considerations
</review-criteria>

<instructions>
1. Review the code against all criteria
2. Categorize issues by severity (Critical, Major, Minor, Suggestion)
3. Provide specific line references
4. Suggest fixes with code examples
</instructions>

<output-format>
<summary> - Overall assessment
<issues>
  <critical> - Security/correctness issues requiring immediate fix
  <major> - Significant problems to address
  <minor> - Small improvements
  <suggestions> - Optional enhancements
</issues>
<improved-code> - Refactored version addressing critical/major issues
</output-format>
```

## Debugging Pattern

```xml
Help debug the following issue.

<code language="{{LANGUAGE}}">
{{PROBLEMATIC_CODE}}
</code>

<error-info>
{{ERROR_MESSAGE_OR_BEHAVIOR}}
</error-info>

<expected-behavior>
{{WHAT_SHOULD_HAPPEN}}
</expected-behavior>

<actual-behavior>
{{WHAT_ACTUALLY_HAPPENS}}
</actual-behavior>

<environment>
{{RUNTIME_ENVIRONMENT}}
</environment>

<instructions>
1. Analyze the code and error information
2. Identify the root cause
3. Explain why the issue occurs
4. Provide a fix with explanation
</instructions>

<output-format>
<root-cause> - What's causing the issue
<explanation> - Why this causes the problem
<fix> - Corrected code with inline comments
<prevention> - How to prevent similar issues
</output-format>
```

## Refactoring Pattern

```xml
Refactor the following code to improve {{GOAL}}.

<original-code language="{{LANGUAGE}}">
{{CODE_TO_REFACTOR}}
</original-code>

<refactoring-goals>
1. {{GOAL_1}}
2. {{GOAL_2}}
3. {{GOAL_3}}
</refactoring-goals>

<constraints>
- Maintain backward compatibility
- Keep existing API surface
- {{OTHER_CONSTRAINTS}}
</constraints>

<instructions>
1. Analyze current code structure
2. Identify refactoring opportunities
3. Apply refactoring patterns
4. Ensure functionality is preserved
</instructions>

<output-format>
<analysis> - Current code issues
<approach> - Refactoring strategy
<refactored-code> - Improved version
<changes-summary> - List of changes made
<testing-notes> - What to test after refactoring
</output-format>
```

## Code Documentation Pattern

```xml
Generate documentation for the following code.

<code language="{{LANGUAGE}}">
{{CODE_TO_DOCUMENT}}
</code>

<documentation-style>
{{STYLE_GUIDE}} (e.g., JSDoc, Google Style, NumPy)
</documentation-style>

<audience>
{{WHO_WILL_READ}}
</audience>

<instructions>
1. Add comprehensive docstrings/comments
2. Document parameters, returns, and exceptions
3. Include usage examples
4. Note any important caveats or edge cases
</instructions>

<output-format>
<documented-code> - Code with inline documentation
<api-reference> - Standalone API documentation
<examples> - Usage examples with explanations
</output-format>
```

## Test Generation Pattern

```xml
Generate tests for the following code.

<code language="{{LANGUAGE}}">
{{CODE_TO_TEST}}
</code>

<testing-framework>
{{FRAMEWORK}} (e.g., pytest, Jest, JUnit)
</testing-framework>

<coverage-requirements>
- Happy path scenarios
- Edge cases
- Error conditions
- Boundary values
</coverage-requirements>

<instructions>
1. Identify testable units
2. Create test cases for each requirement
3. Include setup and teardown as needed
4. Add descriptive test names
</instructions>

<output-format>
<test-plan> - Overview of test coverage
<test-code> - Complete test file
<test-data> - Any required fixtures or mocks
</output-format>
```

## Architecture Review Pattern

```xml
Review the following system architecture.

<architecture-diagram>
{{DIAGRAM_OR_DESCRIPTION}}
</architecture-diagram>

<components>
{{COMPONENT_DETAILS}}
</components>

<requirements>
{{SYSTEM_REQUIREMENTS}}
</requirements>

<review-dimensions>
- Scalability
- Reliability
- Security
- Maintainability
- Cost efficiency
</review-dimensions>

<instructions>
1. Evaluate architecture against requirements
2. Identify potential issues in each dimension
3. Suggest improvements
4. Consider trade-offs
</instructions>

<output-format>
<assessment> - Overall architecture evaluation
<strengths> - What works well
<concerns> - Potential issues by dimension
<recommendations> - Suggested improvements with rationale
<trade-offs> - Considerations for each recommendation
</output-format>
```

## API Design Pattern

```xml
Design an API for {{PURPOSE}}.

<requirements>
{{FUNCTIONAL_REQUIREMENTS}}
</requirements>

<constraints>
{{TECHNICAL_CONSTRAINTS}}
</constraints>

<existing-apis>
{{RELATED_ENDPOINTS}}
</existing-apis>

<design-principles>
- RESTful conventions
- Consistent naming
- Proper HTTP methods
- Appropriate status codes
</design-principles>

<instructions>
1. Design endpoint structure
2. Define request/response schemas
3. Specify authentication requirements
4. Document error responses
</instructions>

<output-format>
<endpoints>
  For each endpoint:
  - Method and path
  - Request schema
  - Response schema
  - Status codes
  - Example request/response
</endpoints>
<authentication> - Auth requirements
<rate-limiting> - Rate limit specifications
<versioning> - Versioning strategy
</output-format>
```

## Code Migration Pattern

```xml
Migrate the following code from {{FROM}} to {{TO}}.

<original-code language="{{FROM_LANGUAGE}}">
{{CODE_TO_MIGRATE}}
</original-code>

<target-specs>
Language/Framework: {{TO_LANGUAGE_OR_FRAMEWORK}}
Version: {{VERSION}}
</target-specs>

<migration-requirements>
1. Preserve all functionality
2. Follow target platform idioms
3. {{OTHER_REQUIREMENTS}}
</migration-requirements>

<instructions>
1. Analyze original code functionality
2. Map concepts to target platform
3. Apply target platform best practices
4. Handle platform-specific differences
</instructions>

<output-format>
<migrated-code> - Code in target platform
<mapping-notes> - How concepts were translated
<breaking-changes> - Any API differences
<testing-guide> - How to verify migration
</output-format>
```

## Performance Optimization Pattern

```xml
Optimize the following code for performance.

<code language="{{LANGUAGE}}">
{{CODE_TO_OPTIMIZE}}
</code>

<performance-context>
Current bottleneck: {{BOTTLENECK}}
Target improvement: {{TARGET}}
Constraints: {{CONSTRAINTS}}
</performance-context>

<profiling-data>
{{PROFILING_INFO}}
</profiling-data>

<instructions>
1. Identify performance bottlenecks
2. Propose optimizations
3. Estimate improvement for each
4. Consider trade-offs
</instructions>

<output-format>
<analysis> - Current performance issues
<optimizations>
  For each optimization:
  - Change description
  - Expected improvement
  - Trade-offs
  - Implementation
</optimizations>
<optimized-code> - Final optimized version
<benchmarking> - How to measure improvement
</output-format>
```

## Best Practices for Code Prompts

### Code Presentation
- Always specify `language` attribute for syntax context
- Include relevant imports and dependencies
- Provide enough context for understanding

### Review Criteria
- Be specific about what to review for
- Prioritize by importance to your use case
- Request severity categorization

### Output Control
- Request inline comments for explanations
- Ask for before/after comparisons
- Include testing considerations

### Context Provision
- Explain the code's purpose and environment
- Note any constraints or requirements
- Mention team conventions or standards
