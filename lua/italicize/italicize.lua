-- -----------------------------------------------------------------------------
-- Italicize Logic Module
-- -----------------------------------------------------------------------------
-- This module handles the specific task of forcing italic styles onto
-- existing highlight groups without breaking their colors.
--
-- Technical Note:
--   Neovim's highlight groups often "link" to others (e.g., @function links to Function).
--   To modify them safely, we must resolve the link to its actual values first.
-- -----------------------------------------------------------------------------

local conf = require("italicize.config").config
local M = {}

-- -----------------------------------------------------------------------------
-- Private Helper: Update Highlight Group
-- -----------------------------------------------------------------------------

local function update_hl(group)
    -- 1. Check Exclusion List
    if vim.tbl_contains(conf.exclude_italics_group, group) then
        return
    end

    -- 2. Resolve Highlight
    -- vim.api.nvim_get_hl(0, { ... }) gets the definition.
    -- link = false is CRITICAL here. It follows the chain of links to find the
    -- actual RGB/Hex values. If we omit this, we might try to add italics to
    -- a group that has no color data, effectively breaking it.
    local old_hl = vim.api.nvim_get_hl(0, { name = group, link = false })

    -- 3. Safety Check
    -- If the theme doesn't define this group, 'old_hl' will be empty.
    if not next(old_hl) then return end

    -- 4. Merge & Apply
    -- Force the 'italic' attribute onto the existing definition.
    local new_hl = vim.tbl_extend('force', old_hl, { italic = true })
    vim.api.nvim_set_hl(0, group, new_hl)
end

-- -----------------------------------------------------------------------------
-- Public API
-- -----------------------------------------------------------------------------

function M.add_highlights()
    -- Guard: Check global enable state
    if not vim.g.italics_enabled then return end

    -- Iterate over user-defined groups
    for _, group in ipairs(conf.italics_groups) do
        -- Use pcall (protected call) to prevent the plugin from crashing Neovim
        -- if a specific highlight group name is invalid or malformed.
        pcall(update_hl, group)
    end
end

function M.toggle_italics(option)
    -- Toggle Logic: Set global state based on argument or flip boolean
    if option == nil then
        vim.g.italics_enabled = not vim.g.italics_enabled
    else
        vim.g.italics_enabled = option
    end

    -- Strategy: Reload Colorscheme
    -- Instead of manually trying to remove italics (which is complex),
    -- we reload the current colorscheme. This resets everything to default.
    -- The Autocommand in init.lua will then trigger M.add_highlights()
    -- automatically if the flag is still true.
    if vim.g.colors_name then
        vim.cmd.colorscheme(vim.g.colors_name)
    end
end

return M
