local M = {}

local utils = require "modules.utils"

M.build = function()
  if (not vim.g.is_windows) and utils.executable "make" then
    return "make install_jsregexp"
  end
  return nil
end

M.config = function()
  require("luasnip.loaders.from_vscode").load()
end

return M
