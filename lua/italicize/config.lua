-- -----------------------------------------------------------------------------
-- Neovim Theme Configuration
-- -----------------------------------------------------------------------------
-- This module defines the behavior of the UI theme, specifically handling
-- transparency and italicized syntax groups.
--
-- Usage:
--   local theme_conf = require('conf.theme_config')
--   setup_function(theme_conf.config)
-- -----------------------------------------------------------------------------

local M = {}

M.config = {
    -- Global Toggles
    transparency = false,            -- Disable background for specific groups
    italics = false,                 -- Enable italics for specific groups
    ignore_linked_group = true,      -- Don't apply styles to linked highlights

    -- -------------------------------------------------------------------------
    -- Italicized Groups
    -- -------------------------------------------------------------------------
    -- These groups will be rendered in italics if 'italics = true'
    italics_groups = {
        "Comment",
        "Conditional",
        "Identifier",
        "SpecialChar",
        "SpecialComment",
        "String",
        "Todo",
    },

    -- -------------------------------------------------------------------------
    -- Transparent Groups
    -- -------------------------------------------------------------------------
    -- These groups will have their background color removed if 'transparency = true'
    transparent_groups = {
        -- 1. Base Editor UI
        "Normal",
        "NormalNC",          -- Non-current window
        "NormalFloat",       -- Floating windows
        "FloatBorder",
        "NonText",           -- Tildes at end of buffer
        "EndOfBuffer",
        "MsgArea",
        "MsgSeparator",
        "Cmdline",
        "Pmenu",             -- Popup menu

        -- 2. Sidebar & Dividers
        "LineNr",
        "CursorLineNr",
        "CursorLineNR",      -- Legacy spelling support
        "SignColumn",
        "VertSplit",
        "WinSeparator",

        -- 3. Syntax Highlighting
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

        -- 4. GitSigns Plugins
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",

        -- 5. LSP Diagnostic Signs (Gutter)
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

        -- 7. Legacy LSP Groups (Backward compatibility)
        "LspDiagnosticsDefaultError",
        "LspDiagnosticsDefaultWarning",
        "LspDiagnosticsDefaultInformation",
        "LspDiagnosticsDefaultHint",

        -- 8. Custom / Misc Plugin Groups
        "StalineFilename",
        "SaveAsRoot",
    },

    -- -------------------------------------------------------------------------
    -- Exclusions
    -- -------------------------------------------------------------------------
    -- Specific groups to forcefully exclude from the effects above.
    exclude_transparency_group = {},
    exclude_italics_group = {}
}

return M
