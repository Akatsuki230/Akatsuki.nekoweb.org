#!/bin/bash

read -p "Name: " Name
read -p "Description: " Description

# Input validation for year
while true; do
    read -p "Year (as a number): " Year
    if [[ $Year =~ ^[0-9]+$ ]]; then
        break
    else
        echo "Invalid year. Please enter a number."
    fi
done

# Input validation for month
while true; do
    read -p "Month (as a number): " Month
    if [[ $Month =~ ^[0-9]+$ ]]; then
        Month=$(printf "%02d" $Month)
        break
    else
        echo "Invalid month. Please enter a number."
    fi
done

# Input validation for day
while true; do
    read -p "Day (as a number): " Day
    if [[ $Day =~ ^[0-9]+$ ]]; then
        Day=$(printf "%02d" $Day)
        break
    else
        echo "Invalid day. Please enter a number."
    fi
done

# Ensure the file name is in snake case
Title=$(echo "$Name" | sed -E 's/[^a-zA-Z0-9]+/-/g; s/([a-z0-9])([A-Z])/\1-\2/g' | tr '[:upper:]' '[:lower:]' | sed 's/^-*//;s/-*$//')

# Construct file path
FolderPath="./src/pages/blog/$Year/$Month"
FileName="$Day-$Title.astro"
FullFilePath="$FolderPath/$FileName"

# Create folders if they don't exist
mkdir -p "$FolderPath"

# Create the file
Content="---
import \"@styles/global.module.css\";
export const name = \"$Name\";
export const description = \"$Description\";
export const date = \"$Year-$Month-$Day\";

import Header from \"@components/header.astro\";
import Footer from \"@components/footer.astro\";
import Meta from \"@components/meta.astro\";
import Scripts from \"@components/scripts.astro\";
import Cursor from \"@components/cursor.astro\";
---

<!doctype html>
<html lang=\"en\">
    <head>
        <Meta
            name=\"$Name\"
            description=\"$Description\"
            tag=\"\"
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
</html>"

echo "$Content" > "$FullFilePath"

echo "File created at: $FullFilePath"
