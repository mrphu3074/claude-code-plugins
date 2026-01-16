---
description: Convert an unstructured prompt to use XML tags
argument-hint: [paste prompt or provide file path]
---

Convert an existing unstructured prompt into a well-structured version using Anthropic XML tag best practices.

## Step 1: Get the Original Prompt

Original prompt: $ARGUMENTS

If the argument is a file path (starts with @ or ends in .md/.txt):
- Read the file content

If no prompt provided:
- Ask the user to paste their unstructured prompt

## Step 2: Analyze the Prompt

Identify the components in the original prompt:

1. **Context/Background**: Any background information
2. **Input Data**: Data or content to be processed
3. **Instructions**: What the prompt asks Claude to do
4. **Examples**: Any examples provided
5. **Constraints**: Limitations or requirements
6. **Output Format**: Expected response format (if specified)

## Step 3: Choose Output Format

Ask the user which output format they want the CONVERTED prompt to request:

**Output Format Options:**
- **JSON** - For API integration and programmatic parsing
- **XML** - For structured documents with nested data
- **Markdown** - For human-readable reports and documentation
- **YAML** - For configuration and readable structured data
- **CSV** - For tabular data and spreadsheet export
- **Plain Text** - For simple conversational responses
- **Keep Original** - Maintain whatever format was in the original prompt

Use AskUserQuestion to let the user select their preferred format.

## Step 4: Apply XML Tags

Transform the prompt by:

1. Wrapping context in `<context>` tags
2. Wrapping input data in appropriate tags (`<data>`, `<document>`, `<code>`, etc.)
3. Structuring instructions in `<instructions>` tags
4. Adding `<examples>` with nested `<example>` tags for any examples
5. Adding `<constraints>` for limitations
6. Adding `<output-format>` section with the user's chosen format

## Step 5: Present Comparison

Show side-by-side or before/after comparison:

### Original Prompt
[Show original]

### Converted Prompt (with XML tags)
[Show structured version]

### Improvements Made
- List each structural improvement
- Explain why each tag was added
- Note any ambiguities resolved

## Step 6: Save Options

Ask the user:
1. Would you like to save the converted prompt to `./prompts/`?
2. What filename should be used?

If saving:
- Create `./prompts/` directory if it doesn't exist
- Save with `.md` extension
- Include a metadata comment at the top with conversion date
