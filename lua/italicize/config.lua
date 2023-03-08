local M = {}

M.config = {
    transparent_enable = false,
    italics_enable = false,
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
        "TSInclude ",
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
    extra_italics_groups = {},
    extra_transparent_groups = {},
    exclude = {}
}

return M
