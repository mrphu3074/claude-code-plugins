---
name: Image Description
description: This skill should be used when the user asks to "describe this image", "analyze this screenshot", "describe the UI", "what's in this image", "convert screenshot to description", "extract design from image", "analyze this design", "describe the layout", "what elements are in this image", "parse this UI screenshot", or any task requiring converting images into structured, machine-readable descriptions. Provides comprehensive visual analysis with XML output suitable for AI-to-AI communication.
version: 1.0.0
---

# Image Description Skill

Analyze images and generate comprehensive, machine-readable XML descriptions that enable other AI agents to recreate designs, build UI screens, or convert screenshots into functional applications.

## Overview

This skill enables image-to-description analysis for:
- UI/UX screenshot analysis
- Design mockup documentation
- Screenshot-to-code preparation
- Visual design extraction
- Component inventory creation
- Style guide generation from existing designs

## Quick Start

To analyze an image, use the provided script:

```bash
${CLAUDE_PLUGIN_ROOT}/skills/describe/scripts/describe-image.sh --image screenshot.png
```

To save output to a file:

```bash
${CLAUDE_PLUGIN_ROOT}/skills/describe/scripts/describe-image.sh --image screenshot.png --output description.xml
```

## Configuration

The script uses the same environment variables as image-generation:

| Variable | Default | Description |
|----------|---------|-------------|
| `IMAGE_GEN_API_URL` | `http://127.0.0.1:8317/v1/chat/completions` | API endpoint URL |
| `IMAGE_GEN_API_KEY` | `ccs-internal-managed` | API authentication key |
| `IMAGE_GEN_MODEL` | `gemini-3-pro-image-preview` | Model to use for analysis |

## Script Usage

### Basic Command

```bash
./describe-image.sh --image <image-file> [options]
```

### Parameters

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| --image FILE | Yes | - | The image file to analyze |
| --output FILE | No | stdout | Path where the XML description will be saved |

### Supported Image Formats

- PNG (.png)
- JPEG (.jpg, .jpeg)
- GIF (.gif)
- WebP (.webp)

## Output Format

The analysis produces structured XML containing:

- **Metadata**: Document type, orientation, aspect ratio, platform
- **Layout**: Grid system, structure, sections with dimensions
- **Components**: UI elements with positions, dimensions, styling
- **Typography**: Text elements with font details, sizes, colors
- **Color Palette**: Primary, secondary, accent, background colors
- **Spacing System**: Base units, scale, padding/margin patterns
- **Interactive Elements**: Buttons, links, inputs with states
- **Media Assets**: Images, icons, illustrations with purposes
- **Relationships**: Parent-child and adjacency mappings
- **Responsive Behavior**: Viewport-specific modifications
- **Technical Notes**: Framework patterns, implementation details

## Example Commands

**Analyze a UI screenshot:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/describe/scripts/describe-image.sh \
  --image dashboard-screenshot.png \
  --output dashboard-analysis.xml
```

**Analyze a mobile app screen:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/describe/scripts/describe-image.sh \
  --image mobile-app.png \
  --output mobile-analysis.xml
```

**Quick analysis to stdout:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/describe/scripts/describe-image.sh --image design.png
```

## Workflow

### Standard Image Analysis

1. Identify the image to analyze
2. Execute the description script
3. Review the XML output for completeness
4. Use the structured data for downstream tasks (code generation, design recreation, etc.)

### Use Cases

**Screenshot-to-Code:**
1. Analyze the screenshot with this skill
2. Parse the XML output
3. Use component and layout data to generate code

**Design Documentation:**
1. Analyze design mockups
2. Extract color palette, typography, spacing
3. Generate style guide from structured data

**UI Audit:**
1. Analyze existing UI screenshots
2. Review component inventory
3. Identify patterns and inconsistencies

## Best Practices

### Image Quality
- Use high-resolution images for better analysis
- Ensure UI elements are clearly visible
- Avoid heavily compressed images

### Output Usage
- Parse XML programmatically for automation
- Use component IDs for cross-referencing
- Leverage relationships data for hierarchy understanding

### Integration
- Combine with image-generation skill for design iteration
- Use output as input for code generation tools
- Feed into design system documentation

## Error Handling

If analysis fails:
1. Verify the API endpoint is running
2. Check image file exists and is readable
3. Ensure image format is supported
4. Review API response for specific error messages
5. Verify image size is reasonable (recommended max: 10MB)

## Example Output

```xml
<image-analysis>
  <metadata>
    <type>web-page</type>
    <orientation>landscape</orientation>
    <aspect-ratio>16:9</aspect-ratio>
    <platform>web</platform>
  </metadata>

  <layout>
    <grid-system>
      <columns>12</columns>
      <max-width>1200px</max-width>
    </grid-system>
    <structure>
      <section id="header" position="top-full-width">
        <container>flex-row</container>
        <width>100%</width>
        <height>64px</height>
        <padding>0 24px</padding>
      </section>
    </structure>
  </layout>

  <components>
    <component id="nav-logo" type="logo">
      <position>
        <x>left</x>
        <y>center</y>
        <z-index>1</z-index>
      </position>
      <dimensions>
        <width>120px</width>
        <height>32px</height>
      </dimensions>
      <content>Company Logo</content>
    </component>
  </components>

  <color-palette>
    <primary>#3B82F6</primary>
    <background>#FFFFFF</background>
    <text>
      <primary>#1F2937</primary>
    </text>
  </color-palette>
</image-analysis>
```
