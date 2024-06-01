#!/bin/bash
# Slim Build script
# Generates the site HTML without images, etc.
# Useful when skipping uploading of images, etc.

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

# Start by building
pnpm install
pnpm build

rm -rf ./dist2

cp -r ./dist ./dist2

# Change folder
cd ./dist2

# Delete unnecessary files
find . -type f \( -name "*.webp" -o -name "*.zip" -o -name "*.ico" -o -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.svg" -o -name "*.gif" -o -name "*.ase" -o -name "*.txt" \) -delete

# Compress
zip -r ../dist.zip .

cd ..
