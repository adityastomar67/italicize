local conf = require("config").config

local M = {}


local function highlight(group)
    -- local fg    = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    -- local bg    = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local style = 'gui=italic'
    -- local sp    = color.sp and 'guisp=' .. color.sp or ''

    vim.api.nvim_command(string.format(
        'highlight %s %s',
        group, style
    ))
end

local function _add_highlights()
    if vim.g.italics_enabled ~= true then
        return
    end
    for _, group in ipairs(conf.italics_groups) do
        highlight(group)
    end

    -- if type(conf.extra_groups) == "string" then
    --     if conf.extra_groups == "all" then
    --         local hls = vim.split(vim.api.nvim_exec("highlight", true), "\n")
    --         for _, hl in ipairs(hls) do
    --             highlight(nil)
    --         end
    --     else
    --         highlight(conf.extra_italics_groups)
    --     end
    -- else
    --     for _, group in ipairs(conf.extra_italics_groups) do
    --         highlight(group)
    --     end
    -- end
end



function M.add_highlights()
    if vim.g.italics_enabled ~= true then
        return
    end
    -- ? some plugins calculate colors from basic highlights
    -- : clear immediately
    _add_highlights()
    -- ? some plugins use autocommands to redefine highlights
    -- : clear again after a while
    vim.defer_fn(_add_highlights, 500)
    -- again
    vim.defer_fn(_add_highlights, 1000)
    -- yes, clear 4 times!!!
    vim.defer_fn(_add_highlights, 5000)
end

function M.toggle_italics(option)
    if option == nil then
        vim.g.italics_enabled = not vim.g.italics_enabled
    else
        vim.g.italics_enabled = option
    end
    if vim.g.colors_name then
        vim.cmd("colorscheme " .. vim.g.colors_name)
    else
        vim.cmd("doautocmd ColorScheme")
    end
end

return M
