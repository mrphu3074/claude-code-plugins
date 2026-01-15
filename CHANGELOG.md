# Changelog

All notable changes to the Claude Code Image Generation Plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.2] - 2026-01-15

### Changed
- Synchronized version numbers across `plugin.json` (1.0.0 → 1.0.2) and `marketplace.json` (1.0.1 → 1.0.2)
- Updated plugin configuration for consistency

### Added
- Comprehensive README.md with installation and usage examples
- This CHANGELOG.md to track version history

## [1.0.1] - 2026-01-15

### Added
- Environment variable configuration for image generation API
  - `IMAGE_GEN_API_URL` for custom API endpoints
  - `IMAGE_GEN_API_KEY` for authentication
  - `IMAGE_GEN_MODEL` for model selection
- Smart defaults for local API usage
- Flexible configuration options (environment variables, shell profile, inline)

### Changed
- Updated marketplace metadata
- Removed `jq` dependency from `generate-image.sh` script
- Improved script reliability and portability

### Documentation
- Added critical instruction to prevent reading generated images (context token conservation)
- Enhanced configuration documentation with multiple setup options
- Added environment variable reference table

## [1.0.0] - 2026-01-15

### Added
- Initial release of image generation plugin
- Text-to-image generation using Gemini image models
- Support for multiple aspect ratios (1:1, 4:3, 16:9, 9:16, 3:2)
- Resolution options: 1K, 2K, 4K
- Reference image support (single and multiple)
- Named parameter interface for the generation script
- Comprehensive prompt engineering guidelines
- Example prompts for UI mockups, logos, and marketing materials

### Features
- Marketplace support with `marketplace.json`
- Plugin structure with proper organization
- Skill documentation with usage examples
- Error handling and troubleshooting guide
- Prompt pattern reference guide

### Infrastructure
- Repository restructured as marketplace with plugins subdirectory
- Proper plugin manifest (`plugin.json`)
- Automated image generation via shell script
- Base64 encoding for reference images

---

## Release Notes

### Version 1.0.2
This release focuses on version consistency and documentation. Both the plugin manifest and marketplace manifest now properly reflect version 1.0.2, ensuring smooth updates for users.

### Version 1.0.1
Major improvement in configuration flexibility. Users can now easily customize API endpoints, keys, and models through environment variables, making the plugin adaptable to various deployment scenarios.

### Version 1.0.0
First public release! This plugin brings powerful text-to-image generation capabilities directly into Claude Code, with a focus on UI/UX design, logos, and marketing materials.

---

## Migration Guide

### From 1.0.0 to 1.0.1+
If you were using the default configuration, no changes needed. If you had customized the API endpoint or key, consider migrating to environment variables:

```bash
# Add to ~/.bashrc or ~/.zshrc
export IMAGE_GEN_API_KEY="your-api-key"
export IMAGE_GEN_API_URL="your-endpoint"
```

---

[1.0.2]: https://github.com/mrphu3074/claude-code-plugins/compare/f8ec1dd...411f4a4
[1.0.1]: https://github.com/mrphu3074/claude-code-plugins/compare/250799a...f8ec1dd
[1.0.0]: https://github.com/mrphu3074/claude-code-plugins/releases/tag/v1.0.0
