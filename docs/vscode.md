# VS Code Configurations

# Font

- [Anonymous Pro](https://www.marksimonson.com/fonts/view/anonymous-pro)

## Themes/Color

- [Just Black](https://marketplace.visualstudio.com/items?itemName=nur.just-black)
  - See [`editor.tokenColorCustomizations`](#settings) in my VS Code settings for a few modifications I make to the theme.

## Enable the code Command in PATH

Open Visual Studio Code.
Open the Command Palette: Press Ctrl + Shift + P (or Cmd + Shift + P on macOS).
Type and Select: Shell Command: Install 'code' command in PATH.

### Extension package names for easy install

#### swift install

```
https://gist.githubusercontent.com/admondtamang/5020ddc261ecd5e172aeb21a52730d61/raw/extension.txt

# install extensions.json
curl -s https://gist.github.com/admondtamang/5020ddc261ecd5e172aeb21a52730d61/raw/extension.txt | xargs -L1 code --install-extension

# Update settings.json
curl -s https://gist.githubusercontent.com/admondtamang/5020ddc261ecd5e172aeb21a52730d61/raw/213f5264a755e16ee99399ec3dc6bfd90f1ea8e1/settings.json -o ~/Library/Application\ Support/Code/User/settings.json

# Update keybindings.json
curl -s https://gist.githubusercontent.com/admondtamang/5020ddc261ecd5e172aeb21a52730d61/raw/213f5264a755e16ee99399ec3dc6bfd90f1ea8e1/keybindings.json -o ~/Library/Application\ Support/Code/User/keybindings.json

```

windows

```
# Update settings.json
Invoke-WebRequest -Uri https://gist.githubusercontent.com/admondtamang/5020ddc261ecd5e172aeb21a52730d61/raw/213f5264a755e16ee99399ec3dc6bfd90f1ea8e1/settings.json -OutFile "$env:APPDATA\Code\User\settings.json"

# Update keybindings.json
Invoke-WebRequest -Uri https://gist.githubusercontent.com/admondtamang/5020ddc261ecd5e172aeb21a52730d61/raw/213f5264a755e16ee99399ec3dc6bfd90f1ea8e1/keybindings.json -OutFile "$env:APPDATA\Code\User\keybindings.json"


```

OR

#### Another method: copy the below extenstions and create a file name extensions.txt and execute following command:

```
cat extensions.txt | xargs -L1 code --install-extension
```

```
nur.just-black
fosshaas.fontsize-shortcuts
vscode-icons-team.vscode-icons
dbaeumer.vscode-eslint
esbenp.prettier-vscode
quicktype.quicktype
vunguyentuan.vscode-postcss
streetsidesoftware.code-spell-checker
yoavbls.pretty-ts-errors
quicktype.quicktype
adpyke.codesnap
DotJoshJohnson.xml
bradlc.vscode-tailwindcss
dsznajder.es7-react-js-snippets
infarkt.css-to-jss
paulmolluzzo.convert-css-in-js
styled-components.vscode-styled-components
Prisma.prisma
bierner.markdown-mermaid
golang.go
wallabyjs.console-ninja
johnpapa.vscode-peacock
admondtamang.svg-fix
pratishshr.bharyang-vscode
aaron-bond.better-comments
eamodio.gitlens
sainoba.px-to-rem
techiecouch.laravel-php-essentials
streetsidesoftware.code-spell-checker
```

# Settings

```json
{
  "codesnap.backgroundColor": "#000000",
  "codesnap.containerPadding": "0px",
  "codesnap.showWindowControls": false,
  // "codesnap.transparentBackground": true,
  "cSpell.enabled": true,
  "cSpell.enableFiletypes": ["mdx"],
  "editor.detectIndentation": true,
  "editor.fontFamily": "Anonymous Pro",
  "editor.fontLigatures": true,
  "editor.fontSize": 13,
  "editor.formatOnPaste": false,
  "editor.inlineSuggest.enabled": true,
  "editor.lineHeight": 0,
  "editor.linkedEditing": true,
  "editor.minimap.enabled": false,
  // "editor.multiCursorModifier": "ctrlCmd",
  "editor.snippetSuggestions": "top",
  "editor.suggestSelection": "first",
  "editor.tabSize": 2,
  "editor.tokenColorCustomizations": {
    "textMateRules": [
      {
        "scope": ["keyword.operator", "punctuation.separator"],
        "settings": {
          "fontStyle": ""
        }
      },
      {
        "scope": ["comment", "comment.block"],
        "settings": {
          "fontStyle": "italic",
          "foreground": "#F5F"
        }
      },
      {
        "name": "envKeys",
        "scope": "string.quoted.double.env,source.env,constant.numeric.env",
        "settings": {
          "foreground": "#19354900"
        }
      }
    ]
  },
  "editor.unicodeHighlight.invisibleCharacters": false,
  "emmet.showAbbreviationSuggestions": false,
  "eslint.enable": true,
  "eslint.validate": ["vue", "react", "typescript", "html", "javascript"],
  "explorer.openEditors.visible": 1,
  "extensions.ignoreRecommendations": true,
  "files.autoSave": "onWindowChange",
  "git.autofetch": true,
  "git.openRepositoryInParentFolders": "never",
  "markdown.preview.fontSize": 36,
  "screencastMode.keyboardOptions": {
    "showCommandGroups": false,
    "showCommands": false,
    "showKeybindings": true,
    "showKeys": false,
    "showSingleEditorCursorMoves": true
  },
  "search.exclude": {
    "**/*.code-search": true,
    "**/bower_components": true,
    "**/node_modules": true
  },
  "search.useIgnoreFiles": false,
  "svelte.enable-ts-plugin": true,
  "terminal.integrated.fontSize": 13,
  "vsicons.dontShowNewVersionMessage": true,
  "workbench.editor.labelFormat": "medium",
  "workbench.editor.showTabs": "multiple",
  "workbench.iconTheme": "vscode-icons",
  // "workbench.statusBar.visible": false,
  "[css]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[js]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[handlebars]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[scss]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[svelte]": {
    "editor.defaultFormatter": "svelte.svelte-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "workbench.colorCustomizations": {},
  "terminal.integrated.env.osx": {},
  "terminal.integrated.defaultProfile.osx": "fish",
  "workbench.activityBar.location": "top",
  "cSpell.userWords": ["hookform", "iconsax", "tanstack", "toastify"],
  "go.toolsManagement.autoUpdate": true,
  "console-ninja.featureSet": "Community",
  "explorer.confirmDelete": false,
  "editor.accessibilitySupport": "off",
  "diffEditor.ignoreTrimWhitespace": true,
  "prisma.showPrismaDataPlatformNotification": false,
  "chatgpt.lang": "en",
  "animations.Install-Method": "Apc Customize UI++",
  "update.mode": "manual",
  "apc.imports": [
    "file://${userHome}/.vscode/extensions/brandonkirbyson.vscode-animations-2.0.3/dist/updateHandler.js"
  ],
  "apc.electron": {
    "opacity": 0.9,
    "transparent": true,
    "backgroundColor": "#00000000",
    "vibrancy": "ultra-dark"
  }
  // "workbench.colorTheme": "Transparent Color Theme"
}
```

# Keybindings

```json
[
  {
    "key": "cmd+1",
    "command": "workbench.action.openEditorAtIndex1"
  },
  {
    "key": "ctrl+1",
    "command": "-workbench.action.openEditorAtIndex1"
  },
  {
    "key": "cmd+2",
    "command": "workbench.action.openEditorAtIndex2"
  },
  {
    "key": "ctrl+2",
    "command": "-workbench.action.openEditorAtIndex2"
  },
  {
    "key": "cmd+3",
    "command": "workbench.action.openEditorAtIndex3"
  },
  {
    "key": "ctrl+3",
    "command": "-workbench.action.openEditorAtIndex3"
  },
  {
    "key": "cmd+4",
    "command": "workbench.action.openEditorAtIndex4"
  },
  {
    "key": "ctrl+4",
    "command": "-workbench.action.openEditorAtIndex4"
  },
  {
    "key": "cmd+5",
    "command": "workbench.action.openEditorAtIndex5"
  },
  {
    "key": "ctrl+5",
    "command": "-workbench.action.openEditorAtIndex5"
  },
  {
    "key": "cmd+6",
    "command": "workbench.action.openEditorAtIndex6"
  },
  {
    "key": "ctrl+6",
    "command": "-workbench.action.openEditorAtIndex6"
  },
  {
    "key": "cmd+7",
    "command": "workbench.action.openEditorAtIndex7"
  },
  {
    "key": "ctrl+7",
    "command": "-workbench.action.openEditorAtIndex7"
  },
  {
    "key": "cmd+8",
    "command": "workbench.action.openEditorAtIndex8"
  },
  {
    "key": "ctrl+8",
    "command": "-workbench.action.openEditorAtIndex8"
  },
  {
    "key": "cmd+9",
    "command": "workbench.action.openEditorAtIndex9"
  },
  {
    "key": "ctrl+9",
    "command": "-workbench.action.openEditorAtIndex9"
  },
  {
    "key": "ctrl+1",
    "command": "workbench.action.focusFirstEditorGroup"
  },
  {
    "key": "cmd+1",
    "command": "-workbench.action.focusFirstEditorGroup"
  },
  {
    "key": "ctrl+3",
    "command": "workbench.action.focusThirdEditorGroup"
  },
  {
    "key": "cmd+3",
    "command": "-workbench.action.focusThirdEditorGroup"
  },
  {
    "key": "ctrl+6",
    "command": "workbench.action.focusSixthEditorGroup"
  },
  {
    "key": "cmd+6",
    "command": "-workbench.action.focusSixthEditorGroup"
  },
  {
    "key": "ctrl+7",
    "command": "workbench.action.focusSeventhEditorGroup"
  },
  {
    "key": "cmd+7",
    "command": "-workbench.action.focusSeventhEditorGroup"
  },
  {
    "key": "ctrl+2",
    "command": "workbench.action.focusSecondEditorGroup"
  },
  {
    "key": "cmd+2",
    "command": "-workbench.action.focusSecondEditorGroup"
  },
  {
    "key": "ctrl+4",
    "command": "workbench.action.focusFourthEditorGroup"
  },
  {
    "key": "cmd+4",
    "command": "-workbench.action.focusFourthEditorGroup"
  },
  {
    "key": "ctrl+5",
    "command": "workbench.action.focusFifthEditorGroup"
  },
  {
    "key": "cmd+5",
    "command": "-workbench.action.focusFifthEditorGroup"
  },
  {
    "key": "ctrl+8",
    "command": "workbench.action.focusEighthEditorGroup"
  },
  {
    "key": "cmd+8",
    "command": "-workbench.action.focusEighthEditorGroup"
  }
]
```

## Past Themes

- Original theme I use in some videos:
  - [Seti-Monokai](https://marketplace.visualstudio.com/items?itemName=SmukkeKim.theme-setimonokai)
- I used this darker modification of the above theme for a few videos:
  - [Seti-Black](https://marketplace.visualstudio.com/items?itemName=bobsparadox.seti-black)
