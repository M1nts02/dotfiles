return {
  "mfussenegger/nvim-dap",
  version = "*",
  cmd = require("plugins.dap.dap").cmd,
  config = function()
    require("plugins.dap.dap").config()
  end,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      version = "*",
      cmd = { "DapUIStacks", "DapUIBreakpoints" },
      config = function()
        require "plugins.dap.dap-ui"
      end,
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
    },
  },
}
