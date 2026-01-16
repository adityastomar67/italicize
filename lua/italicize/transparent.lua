local conf = require("italicize.config").config
local M = {}

local function clear_group_bg(group)
    if vim.tbl_contains(conf.exclude_transparency_group, group) then
        return
    end

    -- link=false ensures we get the actual attributes, not just the link name
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })

    if not next(hl) then return end

    -- Check if this is a linked group and if we should ignore it
    if conf.ignore_linked_group then
        -- We check strictly for links by calling get_hl with link=true (default)
        local is_link = vim.api.nvim_get_hl(0, { name = group, link = true })
        if is_link.link then return end
    end

    -- Force background to NONE
    local new_hl = vim.tbl_extend('force', hl, { bg = "NONE", ctermbg = "NONE" })
    vim.api.nvim_set_hl(0, group, new_hl)
end

function M.clear_bg()
    if not vim.g.transparent_enabled then return end

    for _, group in ipairs(conf.transparent_groups) do
        pcall(clear_group_bg, group)
    end
end

function M.toggle_transparent(option)
    if option == nil then
        vim.g.transparent_enabled = not vim.g.transparent_enabled
    else
        vim.g.transparent_enabled = option
    end

    -- Reload colorscheme to reset; autocmd in init.lua handles re-application
    if vim.g.colors_name then
        vim.cmd.colorscheme(vim.g.colors_name)
    end
end

return M
