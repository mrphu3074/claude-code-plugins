# 🎨 Claude Code Plugins Collection

> Supercharge your AI pair programming with image generation, visual analysis, and structured prompt building.

[![Version](https://img.shields.io/badge/version-1.0.2-blue.svg)](https://github.com/mrphu3074/claude-code-plugins)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-purple.svg)](https://code.claude.com)

A collection of powerful Claude Code plugins that extend your AI coding assistant with visual generation, image analysis, and prompt engineering capabilities.

## ✨ Plugins Included

This repository contains two powerful plugins:

### 🎨 Image Plugin
Tools for visual generation and analysis using Gemini image models.

**Skills:**
- **Image Generation**: Text-to-image generation for UI mockups, logos, illustrations, and more
- **Image Description**: Convert screenshots and designs into detailed XML descriptions

### 📝 Prompt Builder Plugin
Build well-structured prompts using Anthropic XML tag best practices.

**Features:**
- **Interactive Commands**: Step-by-step prompt building guides
- **Smart Agent**: Automatically helps structure prompts
- **Template Library**: 10+ pre-built prompt templates
- **Best Practices**: Built-in XML tag patterns and conventions

## 🚀 Quick Start

### Installation

Install from the plugin marketplace:

```bash
claude plugin install github:mrphu3074/claude-code-plugins
```

### Quick Usage Examples

**Generate an image:**
```
"Generate a modern dashboard UI with dark theme"
```

**Describe an image:**
```
"Describe this screenshot: path/to/screenshot.png"
```

**Build a structured prompt:**
```
/build-prompt analyze customer feedback data
```

That's it. Claude handles the rest.

---

## 🎨 Image Plugin

### Overview

The Image Plugin provides two complementary skills for visual workflows:

1. **Image Generation** - Create images from text descriptions
2. **Image Description** - Analyze images and generate structured descriptions

### Use Cases

**Image Generation:**
- 🖼️ UI/UX mockups and design concepts
- 🎯 Logos and branding assets
- 📱 Mobile app screen designs
- 🎪 Marketing banners and materials
- 🎨 Illustrations and artwork
- 📊 Wireframe visualizations

**Image Description:**
- 🔍 Screenshot analysis for documentation
- 🏗️ Design mockup to specification conversion
- 💻 Screenshot-to-code preparation
- 🎨 Visual design extraction and inventory
- 📐 Component and style guide generation

### Image Generation Skill

Generate images from text prompts using Gemini image models.

**Basic Usage:**
```
Generate a modern minimalist dashboard UI with dark theme, showing analytics charts and user metrics
```

**With Specifications:**
```
Create a logo for a tech startup, blue and white colors, minimalist geometric design, 1:1 aspect ratio, 2K resolution
```

**Using Reference Images:**
```
Create a banner in the style of reference-design.jpg with modern tech aesthetic, 16:9 aspect ratio
```

**Features:**
- Multiple aspect ratios: 1:1, 4:3, 16:9, 9:16, and more
- Resolution options: 1K, 2K, 4K
- Single or multiple reference image support
- Custom output paths and filenames
- Context-aware (never wastes tokens reading generated images)

### Image Description Skill

Analyze images and generate comprehensive XML descriptions suitable for AI-to-AI communication.

**Basic Usage:**
```
Describe this screenshot: screenshot.png
```

**With Output File:**
```
Analyze UI-mockup.png and save description to design-spec.xml
```

**Features:**
- Comprehensive XML-structured output
- Metadata extraction (type, orientation, platform)
- Layout and grid system analysis
- Component inventory with positioning
- Typography system documentation
- Color palette extraction with hex codes
- Spacing and dimension measurements
- Interactive elements identification
- Media assets cataloging
- Responsive behavior notes

**Output Structure:**
The generated XML includes:
- `<metadata>` - Document type, orientation, aspect ratio, platform
- `<layout>` - Grid system, sections, structure
- `<components>` - All UI elements with positions and styling
- `<typography>` - Text elements with font details
- `<color-palette>` - Color scheme with hex codes
- `<spacing-system>` - Spacing patterns and base units
- `<interactive-elements>` - Buttons, links, inputs with states
- `<media-assets>` - Images, icons, illustrations
- `<relationships>` - Component hierarchy and connections
- `<responsive-behavior>` - Viewport adaptations

### Configuration

Both skills use environment variables for API configuration:

| Variable | Default | Description |
|----------|---------|-------------|
| `IMAGE_GEN_API_URL` | `http://127.0.0.1:8317/v1/chat/completions` | API endpoint URL |
| `IMAGE_GEN_API_KEY` | `ccs-internal-managed` | API authentication key |
| `IMAGE_GEN_MODEL` | `gemini-3-pro-image-preview` | Model for generation/analysis |

**Setup Options:**

Quick (one-time use):
```bash
export IMAGE_GEN_API_KEY="your-api-key"
```

Persistent (recommended):
```bash
# Add to ~/.bashrc or ~/.zshrc
export IMAGE_GEN_API_KEY="your-api-key"
export IMAGE_GEN_API_URL="https://your-api-endpoint/v1/chat/completions"
export IMAGE_GEN_MODEL="gemini-3-flash-preview"
```

Per-project:
```bash
IMAGE_GEN_API_KEY="project-key" claude
```

---

## 📝 Prompt Builder Plugin

### Overview

Build well-structured prompts using Anthropic XML tag best practices for improved clarity, accuracy, and parseability.

### Why XML Tags?

From Anthropic's documentation:
- **Clarity**: Separate different parts of your prompt (context, instructions, examples)
- **Accuracy**: Reduce errors from misinterpretation
- **Flexibility**: Easy to modify without rewriting everything
- **Parseability**: Easier to extract specific parts of outputs

### Commands

#### `/build-prompt` - Interactive Prompt Building
Step-by-step guided prompt creation with XML structure.

**Usage:**
```bash
/build-prompt analyze sales data and generate insights
```

The command guides you through:
1. Understanding the task
2. Identifying input types
3. Defining output format
4. Adding examples and constraints
5. Structuring with appropriate XML tags

#### `/convert-prompt` - Convert Existing Prompts
Transform unstructured prompts into XML-tagged versions.

**Usage:**
```bash
/convert-prompt
```

Then provide your existing prompt to be restructured.

#### `/prompt-templates` - Template Library
Browse and use 10+ pre-built templates for common use cases.

**Categories:**
- Analysis & Reports (financial analysis, data insights, business reports)
- Code & Development (code review, debugging, documentation)
- Legal & Contracts (contract analysis, document review)
- API & Data Processing (structured outputs, data extraction)

### Agent

The `prompt-builder` agent automatically activates when you're working on prompt engineering tasks.

**Example triggers:**
- "I need to create a prompt for analyzing data"
- "How can I structure this prompt better?"
- "Help me build a prompt with XML tags"

### Essential XML Tag Patterns

**Structural Tags:**
- `<context>` - Background information
- `<instructions>` - What to do
- `<input>` - User-provided data
- `<output>` - Expected format
- `<constraints>` - Limitations and rules

**Content Tags:**
- `<example>` - Sample input/output
- `<data>` - Raw data to process
- `<document>` - Full document text
- `<code>` - Source code
- `<schema>` - Data structure

**Output Control Tags:**
- `<thinking>` - Reasoning process
- `<answer>` - Final response
- `<findings>` - Analysis results
- `<recommendations>` - Suggested actions

### Output Formats

The plugin supports multiple output formats:

| Format | Best For |
|--------|----------|
| **JSON** | API integration, programmatic parsing |
| **XML** | Structured documents, nested data |
| **Markdown** | Human-readable reports, documentation |
| **YAML** | Configuration files, readable structured data |
| **CSV** | Tabular data, spreadsheet export |
| **Plain Text** | Simple responses, conversational |

### Example Workflow

```markdown
## Original Prompt
"Look at this sales data and tell me what's important"

## After /convert-prompt

<task>Analyze sales data and identify key insights</task>

<context>
Sales data from Q4 2025 including revenue, units sold, and customer segments.
</context>

<input>
<data>
[Your sales data here]
</data>
</input>

<instructions>
1. Calculate total revenue and growth rate
2. Identify top-performing products
3. Analyze customer segment distribution
4. Highlight unusual patterns or anomalies
</instructions>

<output>
<findings>
[Key metrics and discoveries]
</findings>

<recommendations>
[Actionable next steps]
</recommendations>
</output>

<constraints>
- Focus on actionable insights
- Include specific numbers and percentages
- Limit to top 5 findings
</constraints>
```

---

## 🎯 Complete Feature List

### Image Plugin
- ✅ Text-to-image generation with multiple models
- ✅ Multiple aspect ratios (1:1, 4:3, 16:9, 9:16, custom)
- ✅ Resolution options (1K, 2K, 4K)
- ✅ Reference image support
- ✅ Image-to-XML description conversion
- ✅ Comprehensive visual analysis
- ✅ Layout and component extraction
- ✅ Color palette identification
- ✅ Typography documentation
- ✅ Smart context management (never reads generated images)
- ✅ Environment variable configuration
- ✅ Custom output paths

### Prompt Builder Plugin
- ✅ Interactive prompt building (`/build-prompt`)
- ✅ Prompt conversion (`/convert-prompt`)
- ✅ Template library (`/prompt-templates`)
- ✅ Automatic agent assistance
- ✅ XML tag pattern library
- ✅ Multiple output format support
- ✅ Save to project directory
- ✅ Best practices built-in

---

## 📖 Documentation

**Image Plugin:**
- [Image Generation Skill](plugins/image/skills/image-generation/SKILL.md) - Complete documentation for text-to-image generation
- [Image Description Skill](plugins/image/skills/describe/SKILL.md) - Complete documentation for image analysis
- [Prompt Patterns](plugins/image/skills/image-generation/references/prompt-patterns.md) - Prompt engineering guide for image generation

**Prompt Builder Plugin:**
- [Plugin Overview](plugins/prompt-builder/README.md) - Full plugin documentation
- [XML Prompt Patterns Skill](plugins/prompt-builder/skills/xml-prompt-patterns/SKILL.md) - XML tag patterns and best practices

## 🛠️ Advanced Usage

### Image Generation Script

Direct script usage for advanced workflows:

```bash
# Basic generation
./plugins/image/skills/image-generation/scripts/generate-image.sh \
  --prompt "modern UI dashboard" \
  --output dashboard.png

# With aspect ratio and resolution
./plugins/image/skills/image-generation/scripts/generate-image.sh \
  --prompt "mobile app login screen" \
  --aspect-ratio "9:16" \
  --resolution "2K" \
  --output mobile-login.png

# With reference images
./plugins/image/skills/image-generation/scripts/generate-image.sh \
  --prompt "logo in this style" \
  --reference-images "style-ref.jpg" \
  --output new-logo.png
```

### Image Description Script

Direct script usage for batch processing:

```bash
# Analyze single image
./plugins/image/skills/describe/scripts/describe-image.sh \
  --image screenshot.png \
  --output description.xml

# Batch process screenshots
for img in screenshots/*.png; do
  ./plugins/image/skills/describe/scripts/describe-image.sh \
    --image "$img" \
    --output "descriptions/$(basename "$img" .png).xml"
done
```

## 🔧 Troubleshooting

### Image Plugin

**Issue: "Error from API" or connection refused**
- Ensure your API endpoint is running
- Verify `IMAGE_GEN_API_URL` is correct
- Check your `IMAGE_GEN_API_KEY` is valid

**Issue: Generated images are low quality**
- Increase resolution: use `2K` or `4K` instead of `1K`
- Be more specific in your prompts
- Consider using reference images for style consistency

**Issue: Image description not detailed enough**
- The model extracts visible elements; ensure the image is clear
- For UI screenshots, ensure text is readable
- Higher resolution source images produce better descriptions

### Prompt Builder Plugin

**Issue: Commands not found**
- Ensure plugin is installed in the correct directory
- Restart Claude Code after installation
- Check `.claude-plugin/plugin.json` exists

**Issue: Templates not loading**
- Verify `plugins/prompt-builder/skills/xml-prompt-patterns/` exists
- Check file permissions

## 🤝 Contributing

Found a bug? Have an idea? PRs are welcome!

1. Fork it
2. Create your feature branch (`git checkout -b feature/awesome-feature`)
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📝 License

These plugins are released under the MIT License. Do whatever you want with them.

## 🙋 Support

Having issues?
- Check the troubleshooting section above
- Review the plugin-specific documentation in the [Documentation](#-documentation) section
- Open an issue on GitHub
- Make sure your API endpoint is running (for Image Plugin)

## 🎪 Fun Facts

- These plugins were built with Claude Code (meta, right?)
- Image Plugin can generate images but won't read them back (saves your precious context tokens)
- The default API URL is localhost because we trust you to run your own infrastructure
- Prompt Builder uses the same XML patterns that Claude itself recommends

---

**Made with ☕ by [@mrphu3074](https://github.com/mrphu3074)**

*Because every developer deserves pretty pictures and well-structured prompts without leaving the terminal.*
