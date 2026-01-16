---
description: Build a structured prompt using XML tags interactively
argument-hint: [task-description]
---

Build a well-structured prompt using Anthropic XML tag best practices.

## Step 1: Understand the Task

Task description: $ARGUMENTS

If no task provided, ask the user:
- What is the purpose of this prompt?
- What kind of input will it process?
- What should the output look like?

## Step 2: Gather Prompt Components

Ask the user to provide or describe:

1. **Context**: Background information needed
2. **Input data**: What will be processed (code, document, data, etc.)
3. **Instructions**: What Claude should do
4. **Constraints**: Any limitations or requirements

## Step 3: Choose Output Format

Ask the user which output format they need using AskUserQuestion:

**Output Format Options:**
- **JSON** - For API integration and programmatic parsing
- **XML** - For structured documents with nested data
- **Markdown** - For human-readable reports and documentation
- **YAML** - For configuration and readable structured data
- **CSV** - For tabular data and spreadsheet export
- **Plain Text** - For simple conversational responses

Include the selected format in the `<output-format>` section of the generated prompt.

## Step 4: Select Tag Pattern

Based on the task type, recommend appropriate XML tags:

- **Analysis tasks**: `<document>`, `<analysis-criteria>`, `<findings>`, `<recommendations>`
- **Code tasks**: `<code language="...">`, `<review-criteria>`, `<issues>`, `<improved-code>`
- **Data tasks**: `<data format="...">`, `<schema>`, `<transformed-data>`
- **Legal tasks**: `<agreement>`, `<standard-contract>`, `<findings>`, `<recommendations>`

## Step 5: Build the Prompt

Construct the prompt with:

1. Role/persona (if needed)
2. `<context>` - Background information
3. `<input>` or domain-specific tag - User data placeholder
4. `<instructions>` - Step-by-step tasks
5. `<constraints>` - Limitations (if any)
6. `<output-format>` - Expected response format based on user's choice

## Step 6: Present and Save Options

Display the generated prompt to the user.

Ask the user:
1. **Review**: Is this prompt structure correct?
2. **Save**: Would you like to save to `./prompts/` directory?
   - If yes, create the directory if needed and save with descriptive filename
3. **Explain**: Would you like an explanation of the tag choices?

Provide clear explanation of:
- Why each tag was chosen
- How the structure improves clarity
- Tips for customizing the prompt
