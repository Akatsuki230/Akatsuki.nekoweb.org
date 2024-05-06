
# Slim Build script
# Generates the site HTML without images, etc.

# Start by building
yarn.cmd
yarn.cmd build

# Change folder
Set-Location -Path .\dist

# Delete unnecessary files
Get-ChildItem -Recurse -File *.webp | Remove-Item
Get-ChildItem -Recurse -File *.zip | Remove-Item
Get-ChildItem -Recurse -File *.ico | Remove-Item
Get-ChildItem -Recurse -File *.png | Remove-Item
Get-ChildItem -Recurse -File *.jpg | Remove-Item
Get-ChildItem -Recurse -File *.jpeg | Remove-Item
Get-ChildItem -Recurse -File *.svg | Remove-Item

# Compress
Compress-Archive -Path . -DestinationPath dist.zip