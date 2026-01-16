-- -----------------------------------------------------------------------------
-- Transparency Logic Module
-- -----------------------------------------------------------------------------
-- This module handles removing the background colors from specific highlight
-- groups to achieve a "transparent" look (showing the terminal background).
--
-- Technical Note:
--   To make a group transparent in Neovim, we set its `bg` (GUI) and
--   `ctermbg` (Terminal) attributes to "NONE".
-- -----------------------------------------------------------------------------

local conf = require("italicize.config").config
local M = {}

-- -----------------------------------------------------------------------------
-- Private Helper: Clear Background
-- -----------------------------------------------------------------------------

local function clear_group_bg(group)
    -- 1. Check Exclusion List
    -- Ensure we don't clear groups the user explicitly wants to keep opaque.
    if vim.tbl_contains(conf.exclude_transparency_group, group) then
        return
    end

    -- 2. Resolve Highlight
    -- link = false resolves the group to its actual values.
    -- If we didn't do this, modifying a linked group would break the link.
    local current_hl = vim.api.nvim_get_hl(0, { name = group, link = false })

    -- 3. Safety Check
    -- If the group doesn't exist in the current theme, stop.
    if not next(current_hl) then return end

    -- 4. Merge & Apply
    -- Force background to NONE while preserving foreground/styles.
    local new_hl = vim.tbl_extend("force", current_hl, {
        bg = "NONE",
        ctermbg = "NONE"
    })

    vim.api.nvim_set_hl(0, group, new_hl)
end

-- -----------------------------------------------------------------------------
-- Public API
-- -----------------------------------------------------------------------------

function M.clear_bg()
    -- Guard: Check global enable state
    if not vim.g.transparent_enabled then return end

    -- Iterate over user-defined groups
    for _, group in ipairs(conf.transparent_groups) do
        -- Use pcall to prevent errors if a specific group name is invalid
        -- or missing in the current color scheme.
        pcall(clear_group_bg, group)
    end
end

function M.toggle_transparent(option)
    -- Toggle Logic
    if option == nil then
        vim.g.transparent_enabled = not vim.g.transparent_enabled
    else
        vim.g.transparent_enabled = option
    end

    -- Strategy: Reload Colorscheme
    -- Like italics, the cleanest way to "undo" transparency (restore backgrounds)
    -- is to reload the theme, then re-apply (or not) based on the new flag.
    if vim.g.colors_name then
        vim.cmd.colorscheme(vim.g.colors_name)
    end
end

return M
