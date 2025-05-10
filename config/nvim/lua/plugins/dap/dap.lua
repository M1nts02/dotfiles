local utils = require "modules.utils"
local setmap = utils.setmap

local M = {}

setmap {
  {
    { "n" },
    "<F5>",
    function()
      require("dap").continue()
    end,
    { noremap = true, desc = "Debug:Continue" },
  },
  {
    { "n" },
    "<F9>",
    function()
      require("dap").toggle_breakpoint()
    end,
    { noremap = true, desc = "Debug:Toggle Breakpoint" },
  },
  {
    { "n" },
    "<F10>",
    function()
      require("dap").step_over()
    end,
    { noremap = true, desc = "Debug:Step Over" },
  },
  {
    { "n" },
    "<F11>",
    function()
      require("dap").step_into()
    end,
    { noremap = true, desc = "Debug:Step Into" },
  },
}

function M.config()
  require "plugins.dap.configurations" -- Load configurations
  require "plugins.dap.adapters" -- Load adapters
end

return M
