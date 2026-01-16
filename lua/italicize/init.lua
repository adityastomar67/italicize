-- -----------------------------------------------------------------------------
-- Italicize / Transparency Plugin - Main Module
-- -----------------------------------------------------------------------------
-- This module acts as the entry point (setup) for the styling logic.
-- It registers user commands, handles configuration merging, and ensures
-- styles persist across color scheme changes.
--
-- Features:
--   - Dynamic toggling of Transparency and Italics.
--   - Persistence via global variables (vim.g.*).
--   - Auto-reapplication on ColorScheme changes.
-- -----------------------------------------------------------------------------

local conf = require("italicize.config")
local transparent = require("italicize.transparent")
local italicize = require("italicize.italicize")

local M = {}

-- -----------------------------------------------------------------------------
-- Command Registration
-- -----------------------------------------------------------------------------
-- Creates :TransparentToggle, :ItalicsToggle, etc.

local function create_commands()
    -- Transparency
    vim.api.nvim_create_user_command("TransparentEnable", function()
        transparent.toggle_transparent(true)
    end, {})

    vim.api.nvim_create_user_command("TransparentDisable", function()
        transparent.toggle_transparent(false)
    end, {})

    vim.api.nvim_create_user_command("TransparentToggle", function()
        transparent.toggle_transparent()
    end, {})

    -- Italics
    vim.api.nvim_create_user_command("ItalicsEnable", function()
        italicize.toggle_italics(true)
    end, {})

    vim.api.nvim_create_user_command("ItalicsDisable", function()
        italicize.toggle_italics(false)
    end, {})

    vim.api.nvim_create_user_command("ItalicsToggle", function()
        italicize.toggle_italics()
    end, {})
end

-- -----------------------------------------------------------------------------
-- Autocommands
-- -----------------------------------------------------------------------------
-- Ensures styles are re-applied when the user changes themes (:colorscheme).

local function create_autocmds()
    local group = vim.api.nvim_create_augroup("ItalicizePlugin", { clear = true })

    vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = function()
            -- Defer execution slightly to ensure the new theme has fully loaded
            -- and defined its highlight groups before we modify them.
            vim.schedule(function()
                transparent.clear_bg()
                italicize.add_highlights()
            end)
        end,
    })
end

-- -----------------------------------------------------------------------------
-- Setup Function
-- -----------------------------------------------------------------------------
-- The public entry point called by the user's config.

function M.setup(user_config)
    -- 1. Merge User Config with Defaults
    conf.config = vim.tbl_deep_extend("force", conf.config, user_config or {})

    -- 2. Initialize Global State (if not already set)
    --    We use vim.g so state persists across reloads.
    if vim.g.transparent_enabled == nil then
        vim.g.transparent_enabled = conf.config.transparency
    end
    if vim.g.italics_enabled == nil then
        vim.g.italics_enabled = conf.config.italics
    end

    -- 3. Register System
    create_commands()
    create_autocmds()

    -- 4. Initial Application
    --    Apply styles immediately on startup based on current state.
    vim.schedule(function()
        if vim.g.transparent_enabled then
            transparent.clear_bg()
        end
        if vim.g.italics_enabled then
            italicize.add_highlights()
        end
    end)
end

return M
