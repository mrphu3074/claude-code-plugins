#!/bin/bash

# Text-to-Image Generation Script
# Usage: ./generate-image.sh --prompt "your prompt here" [--output file.png] [--aspect-ratio 16:9] [--size 1K] [--reference img1.png,img2.png]

set -e

# Configuration (from environment variables with defaults)
API_URL="${IMAGE_GEN_API_URL:-http://127.0.0.1:8317/v1/chat/completions}"
API_KEY="${IMAGE_GEN_API_KEY:-ccs-internal-managed}"
MODEL="${IMAGE_GEN_MODEL:-gemini-3-pro-image-preview}"

# Default values
PROMPT=""
OUTPUT_FILE="./image.png"
ASPECT_RATIO="16:9"
IMAGE_SIZE="1K"
REFERENCE_IMAGES=""

# Parse command line arguments
show_usage() {
    echo "Usage: $0 --prompt \"<prompt>\" [options]"
    echo ""
    echo "Required:"
    echo "  --prompt TEXT           The image generation prompt"
    echo ""
    echo "Optional:"
    echo "  --output FILE           Output file path (default: ./image.png)"
    echo "  --aspect-ratio RATIO    Aspect ratio: 1:1, 4:3, 16:9, 9:16, etc. (default: 16:9)"
    echo "  --size SIZE             Image size: 1K, 2K, or 4K (default: 1K)"
    echo "  --reference FILES       Reference image(s) for style consistency"
    echo "                          Single: --reference img.png"
    echo "                          Multiple: --reference img1.png,img2.png,img3.png"
    echo "                          Supported formats: .png, .jpg, .jpeg, .gif, .webp"
    echo ""
    echo "Examples:"
    echo "  $0 --prompt \"A beautiful sunset\""
    echo "  $0 --prompt \"Modern logo\" --output logo.png --aspect-ratio 1:1 --size 2K"
    echo "  $0 --prompt \"Style like this\" --reference style.jpg"
    echo "  $0 --prompt \"Combine these styles\" --reference img1.png,img2.png"
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --prompt)
            PROMPT="$2"
            shift 2
            ;;
        --output)
            OUTPUT_FILE="$2"
            shift 2
            ;;
        --aspect-ratio)
            ASPECT_RATIO="$2"
            shift 2
            ;;
        --size)
            IMAGE_SIZE="$2"
            shift 2
            ;;
        --reference)
            REFERENCE_IMAGES="$2"
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
if [ -z "$PROMPT" ]; then
    echo "Error: --prompt is required"
    echo ""
    show_usage
    exit 1
fi

# Validate and encode reference images if provided
REF_IMAGE_CONTENT=""
if [ -n "$REFERENCE_IMAGES" ]; then
    # Split comma-separated list into array
    IFS=',' read -ra IMAGE_ARRAY <<< "$REFERENCE_IMAGES"

    for REF_IMAGE in "${IMAGE_ARRAY[@]}"; do
        # Trim whitespace
        REF_IMAGE=$(echo "$REF_IMAGE" | xargs)

        if [ ! -f "$REF_IMAGE" ]; then
            echo "Error: Reference image not found: $REF_IMAGE"
            exit 1
        fi

        # Check for extension
        if [[ "$REF_IMAGE" != *.* ]]; then
            echo "Error: Reference image must have a file extension: $REF_IMAGE"
            exit 1
        fi

        # Extract and normalize extension
        EXT="${REF_IMAGE##*.}"
        EXT_LOWER=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

        # Validate format
        case "$EXT_LOWER" in
            png|jpg|jpeg|gif|webp) ;;
            *)
                echo "Error: Invalid image format for $REF_IMAGE. Supported: .png, .jpg, .jpeg, .gif, .webp"
                exit 1
                ;;
        esac

        # Determine MIME type
        MIME_TYPE="image/${EXT_LOWER}"
        [ "$EXT_LOWER" = "jpg" ] && MIME_TYPE="image/jpeg"

        REF_IMAGE_BASE64=$(base64 -w 0 < "$REF_IMAGE")
        # Reference images go FIRST in content array
        REF_IMAGE_CONTENT="${REF_IMAGE_CONTENT}{\"type\":\"image_url\",\"image_url\":{\"url\":\"data:${MIME_TYPE};base64,${REF_IMAGE_BASE64}\"}},"
    done
fi

echo "Generating image..."
echo "  Prompt: $PROMPT"
echo "  Output: $OUTPUT_FILE"
echo "  Aspect Ratio: $ASPECT_RATIO"
echo "  Image Size: $IMAGE_SIZE"
if [ -n "$REFERENCE_IMAGES" ]; then
    echo "  Reference Images: $REFERENCE_IMAGES"
fi

# Escape prompt for JSON
PROMPT_ESCAPED=$(echo "$PROMPT" | sed 's/\\/\\\\/g; s/"/\\"/g')

# Make API request
RESPONSE=$(curl -s -X POST "$API_URL" \
    -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d @- <<EOF
{
    "model": "$MODEL",
    "messages": [
        {
            "role": "user",
            "content": [${REF_IMAGE_CONTENT}{"type":"text","text":"$PROMPT_ESCAPED"}]
        }
    ],
    "modalities": ["image", "text"],
    "image_config": {
        "aspect_ratio": "$ASPECT_RATIO",
        "image_size": "$IMAGE_SIZE"
    }
}
EOF
)

# Check for errors (look for "error" key in response)
if echo "$RESPONSE" | grep -q '"error"'; then
    echo "Error from API:"
    # Extract error message using grep and sed
    ERROR_MSG=$(echo "$RESPONSE" | grep -o '"error"[^}]*' | head -1)
    echo "$ERROR_MSG"
    exit 1
fi

# Extract all image URLs from the response
# Pattern: "image_url":{"url":"data:image/..."}
IMAGE_URLS=$(echo "$RESPONSE" | grep -oE '"url":"data:image/[^"]+' | sed 's/"url":"//')

if [ -z "$IMAGE_URLS" ]; then
    echo "No images in response. Full response:"
    echo "$RESPONSE"
    exit 1
fi

# Count images
IMAGE_COUNT=$(echo "$IMAGE_URLS" | wc -l)
echo "Received $IMAGE_COUNT image(s)"

# Process each image
i=0
while IFS= read -r IMAGE_URL; do
    i=$((i + 1))

    if [ -z "$IMAGE_URL" ]; then
        echo "Failed to extract image URL for image $i"
        continue
    fi

    echo "Generated image $i: ${IMAGE_URL:0:50}..."

    # Remove data URI prefix and decode base64
    BASE64_DATA=$(echo "$IMAGE_URL" | sed 's/^data:image\/[^;]*;base64,//')

    # Determine output filename for multiple images
    if [ "$IMAGE_COUNT" -gt 1 ]; then
        BASENAME="${OUTPUT_FILE%.*}"
        EXTENSION="${OUTPUT_FILE##*.}"
        SAVE_PATH="${BASENAME}_${i}.${EXTENSION}"
    else
        SAVE_PATH="$OUTPUT_FILE"
    fi

    # Decode and save
    echo "$BASE64_DATA" | base64 -d > "$SAVE_PATH"
    echo "Saved image to $SAVE_PATH"
done <<< "$IMAGE_URLS"

echo "Done!"
