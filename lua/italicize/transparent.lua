local config_module = require("italicize.config")
local M = {}

local function clear_group_bg(group)
    -- 1. Get the existing highlight properties (link=false gives us the actual colors)
    local current_hl = vim.api.nvim_get_hl(0, { name = group, link = false })

    -- 2. Create a new definition by merging:
    --    Existing Properties + { bg = "NONE" }
    local new_hl = vim.tbl_extend("force", current_hl, {
        bg = "NONE",
        ctermbg = "NONE"
    })

    -- 3. Apply the updated definition
    vim.api.nvim_set_hl(0, group, new_hl)
end

function M.clear_bg()
    local conf = config_module.config
    if not vim.g.transparent_enabled then return end

    for _, group in ipairs(conf.transparent_groups) do
        -- Use pcall to avoid errors if a group doesn't exist
        pcall(clear_group_bg, group)
    end
end

function M.toggle_transparent(option)
    if option == nil then
        vim.g.transparent_enabled = not vim.g.transparent_enabled
    else
        vim.g.transparent_enabled = option
    end

    -- Reload colorscheme to reset everything, then re-apply transparency
    if vim.g.colors_name then
        vim.cmd.colorscheme(vim.g.colors_name)
    end
end

return M
