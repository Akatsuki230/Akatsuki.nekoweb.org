#!/bin/bash

echo "Downloading third party scripts..."

cd ./public

if [[ ! -d "./scripts" ]]; then
    mkdir scripts
fi

cd scripts

# Download scripts

echo "Getting cursoreffects.js..."

curl -Lo cursoreffects.js https://unpkg.com/cursor-effects@latest/dist/browser.js

echo "Finished. You can now start."

cd ../../
