
# Check scripts

if (!(Test-Path -Path .\public\scripts\cursoreffects.js)) {
    Write-Output "Downloading scripts..."
    .\GetThirdParty.ps1
}

# Check data

if (!(Test-Json -Path .\webdata.json)) {
    Write-Output "Error: Invalid JSON data"
    exit
}

# Build

yarn.cmd
yarn.cmd build

Write-Output "Finished"
