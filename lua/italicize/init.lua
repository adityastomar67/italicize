local conf = require("config")

local M = {}

function M.setup(user_config)
    conf.config = vim.tbl_extend("force", conf.config, user_config)

    if vim.g.transparent_enabled == nil then
        vim.g.transparent_enabled = conf.config.transparent_enable
    end

    if vim.g.italics_enabled == nil then
        vim.g.italics_enabled = conf.config.italics_enable
    end
end

return M
