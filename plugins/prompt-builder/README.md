# Prompt Builder Plugin

A Claude Code plugin for building well-structured prompts using Anthropic XML tag best practices.

## Features

- **Interactive Prompt Building**: Guide users through creating structured prompts step-by-step
- **Prompt Conversion**: Transform unstructured prompts into XML-tagged versions
- **Template Library**: 10+ pre-built templates for common use cases
- **Best Practices**: Built-in knowledge of XML tag patterns and conventions

## Installation

```bash
claude --plugin-dir /path/to/prompt-builder
```

Or copy to your project's `.claude-plugin/` directory.

## Usage

### Commands

- `/build-prompt` - Interactive guided prompt building
- `/convert-prompt` - Convert existing prompt to use XML tags
- `/prompt-templates` - Browse and use pre-built templates

### Agent

The `prompt-builder` agent can be triggered automatically when working on prompt engineering tasks.

## Tag Categories

The plugin includes patterns for:

- **Analysis & Reports**: Financial analysis, data insights, business reports
- **Code & Development**: Code review, debugging, documentation
- **Legal & Contracts**: Contract analysis, document review
- **API & Data Processing**: Structured outputs, data extraction

## Output Formats

The plugin always asks you to choose your preferred output format:

| Format | Best For |
|--------|----------|
| **JSON** | API integration, programmatic parsing |
| **XML** | Structured documents, nested data |
| **Markdown** | Human-readable reports, documentation |
| **YAML** | Configuration files, readable structured data |
| **CSV** | Tabular data, spreadsheet export |
| **Plain Text** | Simple responses, conversational |

## Save Options

- Display structured prompt with explanation
- Save to `./prompts/` directory in your project

## Why XML Tags?

From Anthropic's documentation:

- **Clarity**: Separate different parts of your prompt
- **Accuracy**: Reduce misinterpretation errors
- **Flexibility**: Easy to modify without rewriting
- **Parseability**: Easier post-processing of outputs
