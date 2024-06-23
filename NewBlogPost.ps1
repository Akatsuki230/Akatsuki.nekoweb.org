$Name = Read-Host -Prompt "Name"
$Description = Read-Host -Prompt "Description"

# Input validation for year
do {
    $Year = Read-Host -Prompt "Year (as a number)"
} until ($Year -match '^\d+$')

# Input validation for month
do {
    $Month = Read-Host -Prompt "Month (as a number)"
} until ($Month -match '^\d+$')
$Month = '{0:D2}' -f [int]$Month

# Input validation for day
do {
    $Day = Read-Host -Prompt "Day (as a number)"
} until ($Day -match '^\d+$')
$Day = '{0:D2}' -f [int]$Day

# Ensure the file name is in snake case
$Title = $Name -creplace '[^a-zA-Z0-9]', '-'
$Title = ($Title -creplace '(?<=[a-z0-9])([A-Z])','-$1').Trim('-')
$Title = $Title.ToLower()

# Construct file path
$FolderPath = ".\src\pages\blog\$Year\$Month"
$FileName = "$Day-$Title.astro"
$FullFilePath = Join-Path -Path $FolderPath -ChildPath $FileName

# Create folders if they don't exist
if (-not (Test-Path $FolderPath)) {
    New-Item -Path $FolderPath -ItemType Directory -ErrorAction SilentlyContinue
}

# Create the file
$Content = @"
---
import "@styles/global.module.css";
export const name = "$Name";
export const description = "$Description";
export const date = "$Year-$Month-$Day";

import Header from "@components/header.astro";
import Footer from "@components/footer.astro";
import Meta from "@components/meta.astro";
import Scripts from "@components/scripts.astro";
import Cursor from "@components/cursor.astro";
---

<!doctype html>
<html lang="en">
    <head>
        <Meta
            name="$Name"
            description="$Description"
            tag=""
        />
        <Scripts />
        <Cursor />
    </head>
    <body>
        <Header />
        <main>

        </main>
        <Footer />
    </body>
</html>
"@

$Content = $Content -creplace '\{name\}',$Name
$Content = $Content -creplace '\{description\}',$Description

$Content | Out-File -FilePath $FullFilePath -Encoding utf8

Write-Host "File created at: $FullFilePath"
