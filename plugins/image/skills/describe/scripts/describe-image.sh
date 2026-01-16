#!/bin/bash

# Image Description Script
# Usage: ./describe-image.sh --image input.png [--output description.xml]

set -e

# Configuration (from environment variables with defaults)
API_URL="${IMAGE_GEN_API_URL:-http://127.0.0.1:8317/v1/chat/completions}"
API_KEY="${IMAGE_GEN_API_KEY:-ccs-internal-managed}"
MODEL="${IMAGE_GEN_MODEL:-gemini-3-flash-preview}"

# Default values
IMAGE_FILE=""
OUTPUT_FILE=""

# System prompt for image analysis
SYSTEM_PROMPT='You are an expert visual analysis agent specializing in creating comprehensive, machine-readable descriptions of images for AI-to-AI communication. Your descriptions will be used by other AI agents to recreate designs, build UI screens, or convert screenshots into functional applications.

Your description must provide sufficient detail for another AI agent to accurately reconstruct the visual design without seeing the original image. Focus on structural, compositional, and technical details rather than subjective interpretations.

Analyze the image systematically and provide a comprehensive description following these steps:

1. **Overall Structure**: Identify the document type (web page, mobile app, desktop app, print design, etc.), orientation, and aspect ratio
2. **Layout Grid**: Describe the underlying grid system, columns, spacing, and alignment patterns
3. **Visual Hierarchy**: Map the structural layers from background to foreground
4. **Components Inventory**: Catalog all UI elements, their positions, and relationships
5. **Typography System**: Document all text elements with exact styling details
6. **Color Palette**: Extract and specify all colors used (with hex codes when possible)
7. **Spacing & Dimensions**: Measure relative sizes, padding, margins, and gaps
8. **Interactive Elements**: Identify buttons, links, forms, and their states
9. **Media Assets**: Describe images, icons, illustrations, and their purposes
10. **Responsive Considerations**: Note any viewport-specific adaptations visible

Constraints:
- Use precise, technical language suitable for machine parsing
- Provide measurements in relative units (percentages, ratios) when absolute values are not determinable
- Maintain consistent terminology throughout the description
- Avoid subjective aesthetic judgments; focus on objective, measurable attributes
- Include all visible elements, even if they seem minor
- Specify spatial relationships using coordinate-style descriptions (top-left, center-right, etc.)

Structure your response as XML with the following hierarchy:

<image-analysis>
  <metadata>
    <type>[web-page|mobile-app|desktop-app|design-mockup|screenshot|other]</type>
    <orientation>[portrait|landscape|square]</orientation>
    <aspect-ratio>[ratio or dimensions]</aspect-ratio>
    <platform>[web|ios|android|desktop|cross-platform]</platform>
  </metadata>

  <layout>
    <grid-system>
      <columns>[number]</columns>
      <max-width>[value]</max-width>
      <breakpoints>[if applicable]</breakpoints>
    </grid-system>
    <structure>
      <section id="[unique-id]" position="[coordinates]">
        <container>[description]</container>
        <width>[value]</width>
        <height>[value]</height>
        <padding>[values]</padding>
        <margin>[values]</margin>
      </section>
    </structure>
  </layout>

  <components>
    <component id="[unique-id]" type="[button|input|card|nav|header|etc]">
      <position>
        <x>[horizontal position]</x>
        <y>[vertical position]</y>
        <z-index>[layer]</z-index>
      </position>
      <dimensions>
        <width>[value]</width>
        <height>[value]</height>
      </dimensions>
      <styling>
        <background-color>[hex or description]</background-color>
        <border>[specifications]</border>
        <border-radius>[value]</border-radius>
        <shadow>[specifications]</shadow>
      </styling>
      <content>[text or description of content]</content>
      <state>[default|hover|active|disabled]</state>
    </component>
  </components>

  <typography>
    <text-element id="[unique-id]" role="[heading|body|label|etc]">
      <content>[actual text]</content>
      <font-family>[font name]</font-family>
      <font-size>[value]</font-size>
      <font-weight>[100-900 or keyword]</font-weight>
      <line-height>[value]</line-height>
      <letter-spacing>[value]</letter-spacing>
      <color>[hex or description]</color>
      <alignment>[left|center|right|justify]</alignment>
      <position>[location description]</position>
    </text-element>
  </typography>

  <color-palette>
    <primary>[hex code]</primary>
    <secondary>[hex code]</secondary>
    <accent>[hex code]</accent>
    <background>[hex code]</background>
    <text>
      <primary>[hex code]</primary>
      <secondary>[hex code]</secondary>
    </text>
    <additional>
      <color name="[descriptive-name]">[hex code]</color>
    </additional>
  </color-palette>

  <spacing-system>
    <base-unit>[value]</base-unit>
    <scale>[scale factor or specific values]</scale>
    <patterns>
      <pattern type="[padding|margin|gap]">[consistent values observed]</pattern>
    </patterns>
  </spacing-system>

  <interactive-elements>
    <element id="[unique-id]" type="[button|link|input|etc]">
      <label>[text]</label>
      <action>[expected behavior]</action>
      <position>[location]</position>
      <styling>[specifications]</styling>
      <states>
        <state name="[default|hover|active|focus|disabled]">[styling]</state>
      </states>
    </element>
  </interactive-elements>

  <media-assets>
    <asset id="[unique-id]" type="[image|icon|illustration|logo|video]">
      <position>[location]</position>
      <dimensions>[width x height]</dimensions>
      <description>[detailed visual description]</description>
      <purpose>[decorative|functional|informational]</purpose>
      <alt-text>[accessible description]</alt-text>
      <styling>[border, shadow, filters, etc.]</styling>
    </asset>
  </media-assets>

  <relationships>
    <relationship>
      <parent>[component-id]</parent>
      <child>[component-id]</child>
      <type>[contains|adjacent-to|overlays|etc]</type>
    </relationship>
  </relationships>

  <responsive-behavior>
    <viewport size="[mobile|tablet|desktop]">
      <modifications>[layout changes, hidden elements, reordering]</modifications>
    </viewport>
  </responsive-behavior>

  <technical-notes>
    <note>[Any additional technical observations about implementation patterns, frameworks, or special effects]</note>
  </technical-notes>
</image-analysis>'

# Parse command line arguments
show_usage() {
    echo "Usage: $0 --image <image-file> [options]"
    echo ""
    echo "Required:"
    echo "  --image FILE            The image file to analyze"
    echo ""
    echo "Optional:"
    echo "  --output FILE           Output file path for XML description"
    echo "                          If not specified, outputs to stdout"
    echo ""
    echo "Examples:"
    echo "  $0 --image screenshot.png"
    echo "  $0 --image mockup.png --output description.xml"
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --image)
            IMAGE_FILE="$2"
            shift 2
            ;;
        --output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        -h|--help)
            show_usage
            exit 0
            ;;
        *)
            echo "Error: Unknown parameter: $1"
            echo ""
            show_usage
            exit 1
            ;;
    esac
done

# Validate required parameters
if [ -z "$IMAGE_FILE" ]; then
    echo "Error: --image is required"
    echo ""
    show_usage
    exit 1
fi

# Validate image file exists
if [ ! -f "$IMAGE_FILE" ]; then
    echo "Error: Image file not found: $IMAGE_FILE"
    exit 1
fi

# Check for extension
if [[ "$IMAGE_FILE" != *.* ]]; then
    echo "Error: Image file must have a file extension: $IMAGE_FILE"
    exit 1
fi

# Extract and normalize extension
EXT="${IMAGE_FILE##*.}"
EXT_LOWER=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

# Validate format
case "$EXT_LOWER" in
    png|jpg|jpeg|gif|webp) ;;
    *)
        echo "Error: Invalid image format. Supported: .png, .jpg, .jpeg, .gif, .webp"
        exit 1
        ;;
esac

# Determine MIME type
MIME_TYPE="image/${EXT_LOWER}"
[ "$EXT_LOWER" = "jpg" ] && MIME_TYPE="image/jpeg"

echo "Analyzing image..." >&2
echo "  Image: $IMAGE_FILE" >&2
if [ -n "$OUTPUT_FILE" ]; then
    echo "  Output: $OUTPUT_FILE" >&2
fi

# Encode image to base64
IMAGE_BASE64=$(base64 -w 0 < "$IMAGE_FILE")

# Escape system prompt for JSON
SYSTEM_PROMPT_ESCAPED=$(echo "$SYSTEM_PROMPT" | sed 's/\\/\\\\/g; s/"/\\"/g' | tr '\n' ' ')

# Make API request
RESPONSE=$(curl -s -X POST "$API_URL" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d @- <<EOF
{
    "model": "$MODEL",
    "messages": [
        {
            "role": "system",
            "content": "$SYSTEM_PROMPT_ESCAPED"
        },
        {
            "role": "user",
            "content": [
                {"type":"image_url","image_url":{"url":"data:${MIME_TYPE};base64,${IMAGE_BASE64}"}},
                {"type":"text","text":"Analyze this image and provide a comprehensive XML description following the specified format."}
            ]
        }
    ]
}
EOF
)

# Check for errors
if echo "$RESPONSE" | grep -q '"error"'; then
    echo "Error from API:" >&2
    ERROR_MSG=$(echo "$RESPONSE" | grep -o '"error"[^}]*' | head -1)
    echo "$ERROR_MSG" >&2
    exit 1
fi

# Extract content from response using Python for proper JSON decoding
CONTENT=$(echo "$RESPONSE" | python3 -c "import sys, json; data = json.load(sys.stdin); print(data['choices'][0]['message']['content'])" 2>/dev/null || true)

if [ -z "$CONTENT" ]; then
    echo "Failed to extract content from response. Full response:" >&2
    echo "$RESPONSE" >&2
    exit 1
fi

# Output result
if [ -n "$OUTPUT_FILE" ]; then
    echo "$CONTENT" > "$OUTPUT_FILE"
    echo "Description saved to $OUTPUT_FILE" >&2
else
    echo "$CONTENT"
fi

echo "Done!" >&2
