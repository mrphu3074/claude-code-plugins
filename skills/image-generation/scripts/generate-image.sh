#!/bin/bash

# Text-to-Image Generation Script
# Usage: ./generate-image.sh "your prompt here" [output_file.png] [aspect_ratio] [image_size]

set -e

# Configuration
API_URL="http://127.0.0.1:8317/v1/chat/completions"
API_KEY="ccs-internal-managed"

# or gemini-2.5-flash-image-preview
MODEL="gemini-3-pro-image-preview"

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

# Check for errors
if echo "$RESPONSE" | jq -e '.error' > /dev/null 2>&1; then
    echo "Error from API:"
    echo "$RESPONSE" | jq '.error'
    exit 1
fi

# Extract and save images
IMAGE_COUNT=$(echo "$RESPONSE" | jq -r '.choices[0].message.images | length' 2>/dev/null || echo "0")

if [ "$IMAGE_COUNT" = "0" ] || [ "$IMAGE_COUNT" = "null" ]; then
    echo "No images in response. Full response:"
    echo "$RESPONSE" | jq '.'
    exit 1
fi

echo "Received $IMAGE_COUNT image(s)"

for i in $(seq 0 $((IMAGE_COUNT - 1))); do
    IMAGE_URL=$(echo "$RESPONSE" | jq -r ".choices[0].message.images[$i].image_url.url")

    if [ -z "$IMAGE_URL" ] || [ "$IMAGE_URL" = "null" ]; then
        echo "Failed to extract image URL for image $((i + 1))"
        continue
    fi

    echo "Generated image $((i + 1)): ${IMAGE_URL:0:50}..."

    # Remove data URI prefix and decode base64
    BASE64_DATA=$(echo "$IMAGE_URL" | sed 's/^data:image\/[^;]*;base64,//')

    # Determine output filename for multiple images
    if [ "$IMAGE_COUNT" -gt 1 ]; then
        BASENAME="${OUTPUT_FILE%.*}"
        EXTENSION="${OUTPUT_FILE##*.}"
        SAVE_PATH="${BASENAME}_$((i + 1)).${EXTENSION}"
    else
        SAVE_PATH="$OUTPUT_FILE"
    fi

    # Decode and save
    echo "$BASE64_DATA" | base64 -d > "$SAVE_PATH"
    echo "Saved image to $SAVE_PATH"
done

echo "Done!"
