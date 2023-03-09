<div align="center">

  <h1><a href="https://github.com/adityastomar67/nvim-highlights">Nvim Highlights</a></h1>
  <h3>Make any Neovim Colorscheme to support for Italics and Transparency.</h3>

  <!-- <a href="https://github.com/adityastomar67/nvim-highlights/blob/main/LICENSE.md">
  <img alt="License" src="https://img.shields.io/github/license/adityastomar67/nvim-highlights?style=flat&color=eee&label="> </a> -->

  <a href="https://github.com/adityastomar67/nvim-highlights/graphs/contributors">
  <img alt="People" src="https://img.shields.io/github/contributors/adityastomar67/nvim-highlights?style=flat&color=ffaaf2&label=People"> </a>

  <a href="https://github.com/adityastomar67/nvim-highlights/stargazers">
  <img alt="Stars" src="https://img.shields.io/github/stars/adityastomar67/nvim-highlights?style=flat&color=98c379&label=Stars"></a>

  <a href="https://github.com/adityastomar67/nvim-highlights/network/members">
  <img alt="Forks" src="https://img.shields.io/github/forks/adityastomar67/nvim-highlights?style=flat&color=66a8e0&label=Forks"> </a>

  <a href="https://github.com/adityastomar67/nvim-highlights/watchers">
  <img alt="Watches" src="https://img.shields.io/github/watchers/adityastomar67/nvim-highlights?style=flat&color=f5d08b&label=Watches"> </a>

  <a href="https://github.com/adityastomar67/nvim-highlights/pulse">
  <img alt="Last Updated" src="https://img.shields.io/github/last-commit/adityastomar67/nvim-highlights?style=flat&color=e06c75&label="> </a>

</div>

## Usage

You can easily toggle the the transparency and italics with the `TransparentToggle`, `ItalicsToggle` respectively.
If you put true to the italics and transparency in the setup, it will automatically enably on any colorscheme you apply.
```lua
require("italicize").setup({
    transparency = true,
    italics = true,
})
```

### Install

```lua
use {
  "adityastomar67/italicize",
  config = function ()
    require("italicize").setup()
  end
}
```

### Configuration

##### Default Options:
These are the default options for italicize which can be configured via the setup function:
```lua
{
    transparency = false,
    italics = false,
    ignore_linked_group = true,
    italics_groups = {
        "Comment",
        "Conditional",
        "Identifier",
        "SpecialChar",
        "SpecialComment",
        "String",
        "Todo",
        "CmpItemKind",
        "StartifyPath",
        "StartifySlash",
        "packerString",
        "NvimTreeGitRenamed",
        "NvimTreeFileRenamed",
        "NvimTreeMarkdownFile",
        "NvimTreeOpenedFile",
        "NvimTreeRootFolder",
        "TSConstBuiltin",
        "TSEmphasis",
        "TSEnvironmentName",
        "TSInclude",
        "TSKeywordReturn",
        "TSLabel",
        "TSParameter",
        "TSProperty",
        "TSCharacter",
        "TSComment",
        "TSConditional",
        "TSFuncBuiltin",
        "TSFunction",
        "TSKeyword",
        "TSKeywordFunction",
        "TSMethod",
        "TSRepeat",
        "TSString",
        "TSStringEscape",
        "TSStringRegex",
        "TSStringSpecial",
        "TSVariable",
        "TSVariableBuiltin",
    },
    transparent_groups = {
        "Comment",
        "Conditional",
        "Constant",
        "CursorLineNr",
        "CursorLineNR",
        "EndOfBuffer",
        "Function",
        "Identifier",
        "LineNr",
        "NonText",
        "Normal",
        "NormalNC",
        "Operator",
        "PreProc",
        "Repeat",
        "SignColumn",
        "Special",
        "StalineFilename",
        "Statement",
        "String",
        "Structure",
        "Todo",
        "TodoSignDONE",
        "TodoSignFIX ",
        "TodoSignHACK",
        "TodoSignNOTE",
        "TodoSignPERF",
        "TodoSignTEST",
        "TodoSignTODO",
        "TodoSignWARN",
        "Type",
        "Underlined",
        "VertSplit",
    },
    exclude_transparency_group = {},
    exclude_italics_group = {}
}
```