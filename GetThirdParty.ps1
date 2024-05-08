
Write-Output "Downloading third party scripts..."

Set-Location -Path .\public

if (!(Test-Path -Path .\scripts)) {
    mkdir scripts
}

Set-Location -Path .\scripts

# Download scripts

Write-Output "Getting cursoreffects.js..."

curl.exe -Lo cursoreffects.js https://unpkg.com/cursor-effects@latest/dist/browser.js
curl.exe -Lo jquery.js https://code.jquery.com/jquery-3.7.1.min.js

Write-Output "Finished. You can now start."

Set-Location -Path .\..\..\