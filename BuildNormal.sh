#!/bin/bash
# Check scripts

if [ -f "./dist.zip" ]; then
    echo "Deleting existing dist.zip file"
    rm ./dist.zip
fi

if [[ ! -f "./public/scripts/cursoreffects.js" ]]; then
    echo "Downloading scripts..."
    ./GetThirdParty.sh
fi

# Check data

if ! jq empty ./webdata.json 2>/dev/null; then
    echo "Error: Invalid JSON data"
    exit 1
fi

# Build

pnpm install
pnpm build

echo "Finished"
