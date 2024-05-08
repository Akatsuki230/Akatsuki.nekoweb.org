
# Check scripts

if (!(Test-Path -Path .\public\scripts\cursoreffects.js)) {
    Write-Output "Downloading scripts..."
    .\GetThirdParty.ps1
}

if (!(Test-Path -Path .\public\scripts\jquery.js)) {
    Write-Output "Downloading scripts..."
    .\GetThirdParty.ps1
}

# Get data

curl.exe -H "User-Agent: AkatsukiWebBuilder/1.0" -o webdata.json https://nekoweb.org/api/site/info/akatsuki

# Check data

if (!(Test-Json -Path .\webdata.json)) {
    Write-Output "Error: Invalid JSON data"
    exit
}

# Build

yarn.cmd
yarn.cmd build

Write-Output "Finished"
