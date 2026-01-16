---
description: Browse and use pre-built prompt templates
argument-hint: [category or template name]
---

Browse and customize pre-built prompt templates from the prompt-builder library.

## Available Categories

Ask the user which category they need, or show if argument provided:

1. **data-analysis** - Data analysis and insights
2. **code-review** - Code review and debugging
3. **document-analysis** - Document and content analysis
4. **api-integration** - API integration and data processing
5. **data-transformation** - Data cleaning and transformation
6. **test-generation** - Test generation for code
7. **debugging** - Debugging and troubleshooting
8. **content-extraction** - Structured data extraction
9. **documentation** - Technical documentation generation
10. **chain-of-thought** - Step-by-step reasoning analysis

Category requested: $ARGUMENTS

## Step 1: Show Template

If category matches one of the above:
- Read the corresponding template from `${CLAUDE_PLUGIN_ROOT}/skills/xml-prompt-patterns/templates/`
- Display the template with placeholders highlighted

If no match or no argument:
- List all available templates with brief descriptions
- Ask user to select one

## Step 2: Choose Output Format

Ask the user which output format they want for this template:

**Output Format Options:**
- **JSON** - For API integration and programmatic parsing
- **XML** - For structured documents with nested data
- **Markdown** - For human-readable reports and documentation
- **YAML** - For configuration and readable structured data
- **CSV** - For tabular data and spreadsheet export
- **Plain Text** - For simple conversational responses

Use AskUserQuestion to let the user select. Update the `<output-format>` section in the template accordingly.

## Step 3: Customize Template

Ask the user for values to replace placeholders:

For each `{{PLACEHOLDER}}` in the template:
- Ask what value should replace it
- Provide examples of appropriate values
- Offer to leave as placeholder if user prefers

## Step 4: Generate Final Prompt

Create the customized prompt:
1. Replace all provided placeholder values
2. Update output format section based on user's choice
3. Keep remaining placeholders clearly marked
4. Format for readability

## Step 5: Present and Save

Display the customized prompt.

Ask the user:
1. **Copy**: Ready to use? (display in code block for easy copying)
2. **Save**: Save to `./prompts/` directory?
   - Suggest filename based on template and customization
3. **Modify**: Any adjustments needed?

## Template Quick Reference

| Template | Use Case |
|----------|----------|
| 01-data-analysis | Analyze datasets for insights |
| 02-code-review | Review code for issues |
| 03-document-analysis | Analyze documents/contracts |
| 04-api-integration | Generate API client code |
| 05-data-transformation | Transform data formats |
| 06-test-generation | Generate test cases |
| 07-debugging | Debug code issues |
| 08-content-extraction | Extract structured data |
| 09-documentation | Generate docs |
| 10-chain-of-thought | Transparent reasoning |
