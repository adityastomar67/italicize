local conf = require("italicize.config").config

local M = {}

local clear_group_bg = function(group, highlights)
    if not (group or highlights) then
        return
    end

    if group and vim.fn.highlight_exists(group) == 0 then
        return
    end

    group = group or vim.split(highlights, " ")[1]
    highlights = highlights or vim.api.nvim_exec("hi " .. group, true)

    if
        vim.tbl_contains(conf.exclude_transparency_group, group)
        or (conf.ignore_linked_group and highlights:match("links to"))
    then
        return
    end
    pcall(vim.cmd, string.format("hi %s ctermbg=NONE guibg=NONE", group))
end

local function _clear_bg()
    if vim.g.transparent_enabled ~= true then
        return
    end
    for _, group in ipairs(conf.transparent_groups) do
        clear_group_bg(group)
    end
end

function M.clear_bg()
    if vim.g.transparent_enabled ~= true then
        return
    end
    -- ? some plugins calculate colors from basic highlights
    -- : clear immediately
    _clear_bg()
    -- ? some plugins use autocommands to redefine highlights
    -- : clear again after a while
    vim.defer_fn(_clear_bg, 500)
    -- again
    vim.defer_fn(_clear_bg, 1000)
    -- yes, clear 4 times!!!
    vim.defer_fn(_clear_bg, 5000)
end

function M.toggle_transparent(option)
    if option == nil then
        vim.g.transparent_enabled = not vim.g.transparent_enabled
    else
        vim.g.transparent_enabled = option
    end
    if vim.g.colors_name then
        vim.cmd("colorscheme " .. vim.g.colors_name)
    else
        vim.cmd("doautocmd ColorScheme")
    end
end

return M
