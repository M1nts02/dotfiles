local M = {}

local cache = require "modules.cache"
local get_status = cache.get_status

local options = { completion_mode = "source" }

function M.config()
  require("fittencode").setup(options)
  if get_status().g.fittencode then
    vim.cmd "Fitten enable_completions"
  else
    vim.cmd "Fitten disable_completions"
  end
end

return M
