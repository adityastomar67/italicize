local conf = require("italicize.config")
local transparent = require("italicize.transparent")
local italicize = require("italicize.italicize")

local M = {}

local function create_commands()
    -- Transparency Commands
    vim.api.nvim_create_user_command("TransparentEnable", function()
        transparent.toggle_transparent(true)
    end, {})
    vim.api.nvim_create_user_command("TransparentDisable", function()
        transparent.toggle_transparent(false)
    end, {})
    vim.api.nvim_create_user_command("TransparentToggle", function()
        transparent.toggle_transparent()
    end, {})

    -- Italics Commands
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

local function create_autocmds()
    local group = vim.api.nvim_create_augroup("ItalicizePlugin", { clear = true })

    vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = function()
            -- We defer slightly to ensure the colorscheme has finished loading
            vim.schedule(function()
                transparent.clear_bg()
                italicize.add_highlights()
            end)
        end,
    })
end

function M.setup(user_config)
    conf.config = vim.tbl_deep_extend("force", conf.config, user_config or {})

    -- Initialize global state if not set
    if vim.g.transparent_enabled == nil then
        vim.g.transparent_enabled = conf.config.transparency
    end
    if vim.g.italics_enabled == nil then
        vim.g.italics_enabled = conf.config.italics
    end

    create_commands()
    create_autocmds()

    -- Apply immediately on startup
    vim.schedule(function()
        if vim.g.transparent_enabled then transparent.clear_bg() end
        if vim.g.italics_enabled then italicize.add_highlights() end
    end)
end

return M
