local config_module = require("italicize.config")
local M = {}

-- Directly force the background to NONE, exactly like your snippet
local function clear_group_bg(group)
    -- We use force=true to ensure our 'none' overrides whatever was there before
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end

function M.clear_bg()
    local conf = config_module.config

    if not vim.g.transparent_enabled then return end

    for _, group in ipairs(conf.transparent_groups) do
        -- We wrap in pcall just in case a weird group name causes an error,
        -- but generally this will just work silently.
        pcall(clear_group_bg, group)
    end
end

function M.toggle_transparent(option)
    if option == nil then
        vim.g.transparent_enabled = not vim.g.transparent_enabled
    else
        vim.g.transparent_enabled = option
    end

    -- If we are disabling transparency, we must reload the colorscheme
    -- to bring the backgrounds back.
    if not vim.g.transparent_enabled then
        if vim.g.colors_name then
            vim.cmd.colorscheme(vim.g.colors_name)
        end
        return
    end

    -- If enabling, just apply the clears immediately
    M.clear_bg()
end

return M
