local conf = require("italicize.config").config
local M = {}

local function update_hl(group)
    if vim.tbl_contains(conf.exclude_italics_group, group) then
        return
    end

    -- Modern API: get_hl with link=false resolves links to their actual colors
    local old_hl = vim.api.nvim_get_hl(0, { name = group, link = false })

    -- Safety check: if group doesn't exist, old_hl is empty
    if not next(old_hl) then return end

    local new_hl = vim.tbl_extend('force', old_hl, { italic = true })
    vim.api.nvim_set_hl(0, group, new_hl)
end

function M.add_highlights()
    if not vim.g.italics_enabled then return end

    for _, group in ipairs(conf.italics_groups) do
        -- Wrapped in pcall to prevent errors if a group doesn't exist in the current theme
        pcall(update_hl, group)
    end
end

function M.toggle_italics(option)
    if option == nil then
        vim.g.italics_enabled = not vim.g.italics_enabled
    else
        vim.g.italics_enabled = option
    end

    -- Reload colorscheme to reset, then our autocmd in init.lua will re-apply italics
    if vim.g.colors_name then
        vim.cmd.colorscheme(vim.g.colors_name)
    end
end

return M
