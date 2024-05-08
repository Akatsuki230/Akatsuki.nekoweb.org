# Akatsuki's Website

[Akatsuki.nekoweb.org](https://akatsuki.nekoweb.org/)

## Building

1. Install dependencies using `yarn` or `npm install`.
2. Before building, run `GetThirdParty.ps1` to download 3rd party packages.
3. Run the build of the website using `yarn build` or `npm run build`. You can use the dist folder for an initial build.
4. Run a slim build (only HTML files in a separate folder) by running `BuildSlim.ps1`. This is perfect when updating website content on Nekoweb.

## Developing

1. Install dependencies using `yarn` or `npm install`.
2. Before starting dev server, run `GetThirdParty.ps1` to download 3rd party packages.
3. Start the dev server `yarn dev` or `npm run dev`.
4. Make changes and see them happen live in your browser.
