local M = {}

M.config = {
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
        "Type",
        "Underlined",
        "VertSplit",
    },
    exclude_transparency_group = {},
    exclude_italics_group = {}
}

return M
