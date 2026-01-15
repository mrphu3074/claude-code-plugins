# 🎨 Claude Code Image Generation Plugin

> Turn your words into pixels. Because sometimes code needs visuals too.

[![Version](https://img.shields.io/badge/version-1.0.2-blue.svg)](https://github.com/mrphu3074/claude-code-plugins)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Plugin-purple.svg)](https://code.claude.com)

Transform text descriptions into stunning images right from your Claude Code CLI. Whether you're designing UI mockups, creating logos, or just need some quick visual assets, this plugin has you covered.

## ✨ What's This?

A Claude Code plugin that gives your AI pair programmer the superpower of **text-to-image generation** using Gemini's image models. No more switching contexts, no more browser tabs. Just describe what you want, and boom—you've got an image.

**Perfect for:**
- 🖼️ UI/UX mockups and design concepts
- 🎯 Logos and branding assets
- 📱 Mobile app screen designs
- 🎪 Marketing banners and materials
- 🎨 Illustrations and artwork
- 📊 Wireframe visualizations

## 🚀 Quick Start

### Installation

Install this plugin marketplace into Claude Code:

```bash
claude plugin install github:mrphu3074/claude-code-plugins
```

### Basic Usage

Just ask Claude to generate an image:

```
"Generate a modern dashboard UI with dark theme"
```

Or be more specific:

```
"Create a logo for a tech startup, blue and white colors, minimalist geometric design, 1:1 aspect ratio"
```

That's it. Claude handles the rest.

## 🎯 Features

### Smart Configuration
- Environment variable support for API configuration
- Sensible defaults (works out of the box with local API)
- Override-friendly for custom setups

### Flexible Output
- Multiple aspect ratios (1:1, 4:3, 16:9, 9:16, and more)
- Resolution options: 1K, 2K, 4K
- Custom output paths and filenames

### Reference Images
- Single or multiple reference image support
- Style consistency across generated images
- Automatic base64 encoding

### Pro Features
- Context-aware: Never wastes tokens reading generated images
- Detailed prompt engineering guidelines built-in
- Error handling that actually helps

## 🛠️ Configuration

The plugin uses environment variables with smart defaults:

| Variable | Default | What It Does |
|----------|---------|--------------|
| `IMAGE_GEN_API_URL` | `http://127.0.0.1:8317/v1/chat/completions` | Where to send requests |
| `IMAGE_GEN_API_KEY` | `ccs-internal-managed` | Your API key |
| `IMAGE_GEN_MODEL` | `gemini-3-pro-image-preview` | Which model to use |

### Setup Options

**Quick & Dirty (one-time use):**
```bash
export IMAGE_GEN_API_KEY="your-api-key"
```

**Persistent (recommended):**
Add to your `~/.bashrc` or `~/.zshrc`:
```bash
export IMAGE_GEN_API_KEY="your-api-key"
export IMAGE_GEN_API_URL="https://your-api-endpoint/v1/chat/completions"
```

**Per-project:**
```bash
# Just for this session
IMAGE_GEN_API_KEY="project-specific-key" claude
```

## 💡 Examples

### UI Mockup
```
Generate a modern minimalist dashboard UI with dark theme, showing analytics charts and user metrics, 16:9 aspect ratio, 2K resolution
```

### Logo Design
```
Create a professional tech company logo, abstract geometric design, blue and white colors, 1:1 aspect ratio
```

### Mobile Screen
```
Design a mobile app login screen, clean design with gradient background, modern UI, 9:16 aspect ratio
```

### Using Reference Images
```
Create a logo in the style of reference-design.jpg with modern tech aesthetic
```

## 📖 Documentation

For detailed usage, prompt engineering tips, and advanced features, check out:
- [SKILL.md](plugins/image-generation/skills/image-generation/SKILL.md) - Complete skill documentation
- [Prompt Patterns](plugins/image-generation/skills/image-generation/references/prompt-patterns.md) - Prompt engineering guide

## 🤝 Contributing

Found a bug? Have an idea? PRs are welcome!

1. Fork it
2. Create your feature branch (`git checkout -b feature/awesome-feature`)
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📝 License

This plugin is released under the MIT License. Do whatever you want with it.

## 🙋 Support

Having issues?
- Check the [troubleshooting section](plugins/image-generation/skills/image-generation/SKILL.md#error-handling) in the skill docs
- Open an issue on GitHub
- Make sure your API endpoint is actually running (classic mistake)

## 🎪 Fun Facts

- This plugin was built with Claude Code (meta, right?)
- It can generate images but won't read them back (saves your precious context tokens)
- The default API URL is a localhost because we trust you to run your own infrastructure

---

**Made with ☕ by [@mrphu3074](https://github.com/mrphu3074)**

*Because every developer deserves pretty pictures without leaving the terminal.*
