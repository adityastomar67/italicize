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
        -- 1. Base Editor UI
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "NonText",
        "EndOfBuffer",
        "MsgArea",
        "Cmdline",
        "Pmenu",

        -- 2. Sidebar & Dividers
        "LineNr",
        "CursorLineNr",
        "CursorLineNR",
        "SignColumn",
        "VertSplit",
        "WinSeparator",

        -- 3. Syntax Highlighting (From original config)
        "Comment",
        "Conditional",
        "Constant",
        "Function",
        "Identifier",
        "Operator",
        "PreProc",
        "Repeat",
        "Special",
        "Statement",
        "String",
        "Structure",
        "Type",
        "Underlined",

        -- 4. GitSigns
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",

        -- 5. LSP Diagnostic Signs
        "DiagnosticSignError",
        "DiagnosticSignWarn",
        "DiagnosticSignInfo",
        "DiagnosticSignHint",

        -- 6. LSP Diagnostics (Virtual Text & Underlines)
        "DiagnosticError",
        "DiagnosticWarn",
        "DiagnosticInfo",
        "DiagnosticHint",
        "DiagnosticVirtualTextError",
        "DiagnosticVirtualTextWarn",
        "DiagnosticVirtualTextInfo",
        "DiagnosticVirtualTextHint",
        "DiagnosticUnderlineError",
        "DiagnosticUnderlineWarn",
        "DiagnosticUnderlineInfo",
        "DiagnosticUnderlineHint",

        -- 7. Legacy LSP Groups (Optional support for older plugins)
        "LspDiagnosticsDefaultError",
        "LspDiagnosticsDefaultWarning",
        "LspDiagnosticsDefaultInformation",
        "LspDiagnosticsDefaultHint",

        -- 8. Custom / Misc
        "StalineFilename",
        "SaveAsRoot",
    },
    exclude_transparency_group = {},
    exclude_italics_group = {}
}

return M
