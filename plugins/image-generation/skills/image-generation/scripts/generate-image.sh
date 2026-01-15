#!/bin/bash

# Text-to-Image Generation Script
# Usage: ./generate-image.sh "your prompt here" [output_file.png] [aspect_ratio] [image_size]

set -e

# Configuration (from environment variables with defaults)
API_URL="${IMAGE_GEN_API_URL:-http://127.0.0.1:8317/v1/chat/completions}"
API_KEY="${IMAGE_GEN_API_KEY:-ccs-internal-managed}"
MODEL="${IMAGE_GEN_MODEL:-gemini-3-pro-image-preview}"

# Arguments
PROMPT="${1:-"Create a high quality realistic picture"}"
OUTPUT_FILE="${2:-./image.png}"
ASPECT_RATIO="${3:-16:9}"
IMAGE_SIZE="${4:-1K}"

if [ -z "$1" ]; then
    echo "Usage: $0 \"<prompt>\" [output_file.png] [aspect_ratio] [image_size]"
    echo "  prompt:       Required. The image generation prompt"
    echo "  output_file:  Optional. Default: ./image.png"
    echo "  aspect_ratio: Optional. Default: 16:9"
    echo "  image_size:   Optional. 1K, 2K, or 4K. Default: 1K"
    exit 1
fi

echo "Generating image..."
echo "  Prompt: $PROMPT"
echo "  Output: $OUTPUT_FILE"
echo "  Aspect Ratio: $ASPECT_RATIO"
echo "  Image Size: $IMAGE_SIZE"

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
            "content": "$PROMPT"
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
