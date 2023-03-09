local conf = require("italicize.config")

local M = {}

function M.setup(user_config)
    conf.config = vim.tbl_extend("force", conf.config, user_config)

    if vim.g.transparent_enabled == nil then
        vim.g.transparent_enabled = conf.config.transparency
    end

    if vim.g.italics_enabled == nil then
        vim.g.italics_enabled = conf.config.italics
    end
end

return M
