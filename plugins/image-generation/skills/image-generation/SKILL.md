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

To generate an image, use the provided script with named parameters:

```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh --prompt "your prompt here" --output output.png
```

## Configuration

The script uses environment variables for API configuration with sensible defaults:

| Variable | Default | Description |
|----------|---------|-------------|
| `IMAGE_GEN_API_URL` | `http://127.0.0.1:8317/v1/chat/completions` | API endpoint URL |
| `IMAGE_GEN_API_KEY` | `ccs-internal-managed` | API authentication key |
| `IMAGE_GEN_MODEL` | `gemini-3-pro-image-preview` | Model to use for generation |

### Setting Up

**Option 1: Environment variables (recommended)**
```bash
export IMAGE_GEN_API_KEY="your-api-key"
export IMAGE_GEN_API_URL="https://your-api-endpoint/v1/chat/completions"
export IMAGE_GEN_MODEL="gemini-2.5-flash-image-preview"
```

**Option 2: Shell profile (persistent)**
Add to `~/.bashrc` or `~/.zshrc`:
```bash
export IMAGE_GEN_API_KEY="your-api-key"
```

**Option 3: Inline per-command**
```bash
IMAGE_GEN_API_KEY="your-key" ./generate-image.sh "prompt" output.png
```

## Script Usage

### Basic Command

```bash
./generate-image.sh --prompt "<prompt>" [options]
```

### Parameters

| Parameter | Required | Default | Description |
|-----------|----------|---------|-------------|
| --prompt TEXT | Yes | - | Text description of the image to generate |
| --output FILE | No | ./image.png | Path where the image will be saved |
| --aspect-ratio RATIO | No | 16:9 | Aspect ratio (e.g., 1:1, 4:3, 16:9, 9:16) |
| --size SIZE | No | 1K | Resolution: 1K, 2K, or 4K |
| --reference FILES | No | - | Reference image(s) for style/content consistency (.png, .jpg, .jpeg, .gif, .webp). Single or comma-separated list |

### Common Aspect Ratios

| Ratio | Use Case |
|-------|----------|
| 1:1 | Social media posts, profile pictures, icons |
| 4:3 | Presentations, traditional displays |
| 16:9 | Widescreen, desktop wallpapers, YouTube thumbnails |
| 9:16 | Mobile screens, stories, vertical content |
| 3:2 | Photography, print materials |

## Important: Do Not Read Generated Images

**CRITICAL**: After generating an image, do NOT use the Read tool to view the generated file. Reading image files consumes significant context tokens (often 2-4MB per image) and is unnecessary. The script output confirms successful generation with the file path - that is sufficient.

Simply inform the user that the image was generated and provide the file path. Let the user view the image in their preferred image viewer.

## Workflow

### Standard Image Generation

1. Craft a detailed prompt describing the desired image
2. Choose appropriate aspect ratio for the use case
3. Execute the generation script
4. Confirm success to the user with the output path (do NOT read the image file)

### Example Commands

**UI Mockup:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  --prompt "Modern minimalist dashboard UI with dark theme, showing analytics charts and user metrics" \
  --output dashboard-mockup.png \
  --aspect-ratio 16:9 \
  --size 2K
```

**Logo Design:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  --prompt "Professional tech company logo, abstract geometric design, blue and white colors" \
  --output logo.png \
  --aspect-ratio 1:1 \
  --size 1K
```

**Mobile App Screen:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  --prompt "Mobile app login screen, clean design with gradient background, modern UI" \
  --output mobile-login.png \
  --aspect-ratio 9:16 \
  --size 2K
```

**With Single Reference Image:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  --prompt "Create a logo in this style with modern tech aesthetic" \
  --output output-logo.png \
  --aspect-ratio 1:1 \
  --size 2K \
  --reference reference-style.jpg
```

**With Multiple Reference Images:**
```bash
${CLAUDE_PLUGIN_ROOT}/skills/image-generation/scripts/generate-image.sh \
  --prompt "Combine the styles from these references" \
  --output combined.png \
  --reference style1.png,style2.jpg,style3.png
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

### Context Token Conservation

- NEVER read generated image files with the Read tool - they consume 2-4MB of context
- Confirm generation success via script output only
- Let users view images in external viewers

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
5. If using reference image, verify:
   - File exists and is readable
   - Format is supported (.png, .jpg, .jpeg, .gif, .webp)
   - File size is reasonable (recommended max: 5MB)

## Reference Images

When providing reference images:
- **Single reference:** `--reference style.jpg`
- **Multiple references:** `--reference img1.png,img2.png,img3.png`
- All reference images are sent to the API to guide style, composition, or content consistency
- Supported formats: .png, .jpg, .jpeg, .gif, .webp
- Images are base64-encoded automatically
- All images must exist at the specified paths and be readable
- Reference images appear FIRST in the content array, before the text prompt
- Multiple reference images allow combining different style elements or visual concepts

## Additional Resources

### Reference Files

For advanced prompt techniques:
- **`references/prompt-patterns.md`** - Common prompt patterns for different design types

### Example Prompts

Working examples in `examples/`:
- **`examples/ui-prompts.txt`** - UI/UX design prompt examples
- **`examples/marketing-prompts.txt`** - Marketing material prompt examples
