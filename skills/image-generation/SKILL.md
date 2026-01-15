---
name: Image Generation
description: This skill should be used when the user asks to "generate an image", "create an image", "design a mockup", "design a mock", "create a high fidelity design", "text to image", "make a picture", "visualize", "create visual design", "generate artwork", "create illustration", "design UI mockup", "create wireframe visual", "generate logo", "create banner", or any task requiring converting text descriptions into images. Provides text-to-image generation using Gemini image models.
version: 1.0.0
---

# Image Generation Skill

Generate images from text prompts using Gemini image models via a local API endpoint.

## Overview

This skill enables text-to-image generation for:
- UI/UX mockups and design concepts
- High fidelity visual designs
- Illustrations and artwork
- Logos and branding assets
- Banners and marketing materials
- Wireframe visualizations
- Any creative visual content

## Quick Start

To generate an image, use the provided script:

```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh "your prompt here" output.png
```

## Script Usage

### Basic Command

```bash
./generate-image.sh "<prompt>" [output_file] [aspect_ratio] [image_size]
```

### Parameters

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| prompt | Yes | - | Text description of the image to generate |
| output_file | No | ./image.png | Path where the image will be saved |
| aspect_ratio | No | 16:9 | Aspect ratio (e.g., 1:1, 4:3, 16:9, 9:16) |
| image_size | No | 1K | Resolution: 1K, 2K, or 4K |

### Common Aspect Ratios

| Ratio | Use Case |
|-------|----------|
| 1:1 | Social media posts, profile pictures, icons |
| 4:3 | Presentations, traditional displays |
| 16:9 | Widescreen, desktop wallpapers, YouTube thumbnails |
| 9:16 | Mobile screens, stories, vertical content |
| 3:2 | Photography, print materials |

## Workflow

### Standard Image Generation

1. Craft a detailed prompt describing the desired image
2. Choose appropriate aspect ratio for the use case
3. Execute the generation script
4. Review the output and iterate if needed

### Example Commands

**UI Mockup:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  "Modern minimalist dashboard UI with dark theme, showing analytics charts and user metrics" \
  dashboard-mockup.png 16:9 2K
```

**Logo Design:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  "Professional tech company logo, abstract geometric design, blue and white colors" \
  logo.png 1:1 1K
```

**Mobile App Screen:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  "Mobile app login screen, clean design with gradient background, modern UI" \
  mobile-login.png 9:16 2K
```

## Prompt Engineering Guidelines

### Structure Effective Prompts

1. **Subject**: What is the main focus?
2. **Style**: What visual style? (realistic, minimalist, abstract, etc.)
3. **Colors**: Specify color palette if important
4. **Composition**: Describe layout and arrangement
5. **Context**: Background and environment details

### Prompt Templates

**For UI/UX Designs:**
```
[Component type] interface design, [style] aesthetic, [color scheme],
featuring [key elements], [additional details]
```

**For Illustrations:**
```
[Subject] illustration in [art style] style, [mood/atmosphere],
[color palette], [composition details]
```

**For Marketing Materials:**
```
[Material type] design for [purpose], [brand style], featuring
[key message/elements], [dimensions context]
```

## Best Practices

### Prompt Quality

- Be specific and descriptive
- Include style references (e.g., "in the style of flat design")
- Specify important colors and their placement
- Mention lighting and mood when relevant
- Include technical details for UI mockups (e.g., "with navigation bar")

### Output Management

- Use descriptive filenames for generated images
- Organize outputs in project-specific directories
- Generate multiple variations for design choices
- Use appropriate resolution for the intended use

### Iteration Strategy

- Start with a base prompt and refine
- Adjust aspect ratio based on layout needs
- Increase resolution for final versions
- Keep successful prompts for reuse

## Error Handling

If generation fails:
1. Verify the API endpoint is running at http://127.0.0.1:8317
2. Check prompt length (keep under 1000 characters)
3. Ensure output directory exists and is writable
4. Review API response for specific error messages

## Additional Resources

### Reference Files

For advanced prompt techniques:
- **`references/prompt-patterns.md`** - Common prompt patterns for different design types

### Example Prompts

Working examples in `examples/`:
- **`examples/ui-prompts.txt`** - UI/UX design prompt examples
- **`examples/marketing-prompts.txt`** - Marketing material prompt examples
