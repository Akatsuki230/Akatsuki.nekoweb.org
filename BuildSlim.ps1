
# Slim Build script
# Generates the site HTML without images, etc.
# Useful when skipping uploading of images, etc.

# Check scripts

if (!(Test-Path -Path ./public/scripts/cursoreffects.js)) {
    Write-Output "Downloading scripts..."
    ./GetThirdParty.ps1
}

# Check data

if (!(Test-Json -Path ./webdata.json)) {
    Write-Output "Error: Invalid JSON data"
    exit
}

# Start by building
pnpm
pnpm build

Remove-Item -Recurse -Path ./dist2

Copy-Item -Recurse -Path ./dist -Destination ./dist2/

# Change folder
Set-Location -Path ./dist2

# Delete unnecessary files
Get-ChildItem -Recurse -File *.webp | Remove-Item
Get-ChildItem -Recurse -File *.zip | Remove-Item
Get-ChildItem -Recurse -File *.ico | Remove-Item
Get-ChildItem -Recurse -File *.png | Remove-Item
Get-ChildItem -Recurse -File *.jpg | Remove-Item
Get-ChildItem -Recurse -File *.jpeg | Remove-Item
Get-ChildItem -Recurse -File *.svg | Remove-Item
Get-ChildItem -Recurse -File *.gif | Remove-Item
Get-ChildItem -Recurse -File *.ase | Remove-Item
Get-ChildItem -Recurse -File *.txt | Remove-Item

# Compress
Compress-Archive -Path * -DestinationPath dist.zip

Set-Location -Path ..