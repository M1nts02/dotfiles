local utils = require "modules.utils"

return {
  "mfussenegger/nvim-dap",
  version = "*",
  cmd = require("plugins.debug.dap").cmd,
  keys = require("plugins.debug.dap").keys,
  config = require("plugins.debug.dap").configs,
  dependencies = {
    { -- DAP UI
      "rcarriga/nvim-dap-ui",
      version = "*",
      config = function()
        require "plugins.debug.dap-ui"
      end,
      dependencies = { "nvim-neotest/nvim-nio" },
    },
    { -- Support virtual text
      "theHamsta/nvim-dap-virtual-text",
      enabled = utils.executable { "gcc", "clang", "zig", "cc", "cl" },
      opts = {
        virt_text_pos = "eol",
      },
    },
  },
}
