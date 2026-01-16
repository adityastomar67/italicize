<div align="center">

  <h1>Italicize.nvim</h1>

  <p>
    <strong>Force Transparency and Italics support onto <em>any</em> Neovim Colorscheme.</strong>
  </p>

  <a href="https://github.com/adityastomar67/italicize/blob/main/LICENSE.md">
  <img alt="License" src="https://img.shields.io/github/license/adityastomar67/italicize?style=flat&color=eee&label=License"> </a>

  <a href="https://github.com/adityastomar67/italicize/stargazers">
  <img alt="Stars" src="https://img.shields.io/github/stars/adityastomar67/italicize?style=flat&color=e06c75&label=Stars"></a>

  <a href="https://github.com/adityastomar67/italicize/issues">
  <img alt="Issues" src="https://img.shields.io/github/issues/adityastomar67/italicize?style=flat&color=61afef&label=Issues"> </a>

  <a href="https://github.com/adityastomar67/italicize/pulse">
  <img alt="Last Updated" src="https://img.shields.io/github/last-commit/adityastomar67/italicize?style=flat&color=98c379&label=Updated"> </a>

</div>

---

## ✨ Features

* **Universal Support:** Works with any colorscheme by dynamically modifying highlight groups.
* **Granular Control:** Toggle transparency and italics independently.
* **Persistent State:** Remembers your toggle state even if you reload the theme.
* **Highly Configurable:** Easily add or exclude specific syntax groups.

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)
```lua
{
  "adityastomar67/italicize",
  event = "ColorScheme", -- Load when colorscheme changes
  config = function()
    require("italicize").setup({
        transparency = true,
        italics = false,
    })
  end
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim$0)
```lua
use {
  "adityastomar67/italicize",
  config = function ()
    require("italicize").setup()
  end
}
```

## ⚙️ Configuration
You can pass a table to the setup() function to override defaults.
```lua
require("italicize").setup({
    -- Default Toggles
    transparency = false,       -- Enable transparent background by default
    italics = false,            -- Enable italics by default

    -- Exclusions (Groups to ignore)
    exclude_transparency_group = { "CursorLine", "Search" },
    exclude_italics_group = { "Type" },

    -- Overrides (Add your own groups here)
    italics_groups = { "CustomGroup", "AnotherGroup" },
    transparent_groups = { "NvimTreeNormal" }
})
```

### Default Groups
The plugin comes pre-configured with a comprehensive list of groups for standard syntax, TreeSitter, and popular plugins (Telescope, NvimTree, GitSigns, etc.).

<details> <summary><strong>Click to view default Italic Groups</strong></summary>

```lua
italics_groups = {
    "Comment",
    "Conditional",
    "Identifier",
    "SpecialChar",
    "SpecialComment",
    "String",
    "Todo",
    "CmpItemKind",
    -- TreeSitter / Modern Highlights
    "@comment",
    "@conditional",
    "@keyword",
    "@variable",
    -- ... and many more
}
```
</details>

<details> <summary><strong>Click to view default Transparent Groups</strong></summary>

```lua
transparent_groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "LineNr",
    "SignColumn",
    "EndOfBuffer",
    "MsgArea",
    "NvimTreeNormal",
    "TelescopeNormal",
    "WhichKeyFloat",
    -- ... and many more
}
```
</details>

## 🚀 Commands
The plugin provides user commands to toggle effects on the fly.

| Command | Description |
| :--- | :--- |
| `:TransparentToggle` | Toggle transparency on/off. |
| `:TransparentEnable` | Force transparency on. |
| `:TransparentDisable` | Force transparency off. |
| `:ItalicsToggle` | Toggle italics on/off. |
| `:ItalicsEnable` | Force italics on. |
| `:ItalicsDisable` | Force italics off. |

## ⌨️ Keybindings Example
You can map these commands in your init.lua for quick access:

```lua
vim.keymap.set('n', '<leader>tt', '<cmd>TransparentToggle<cr>', { desc = "Toggle Transparency" })
vim.keymap.set('n', '<leader>ti', '<cmd>ItalicsToggle<cr>', { desc = "Toggle Italics" })
```

<div align="center"> <sub>Built with ❤️ for Neovim</sub> </div>
