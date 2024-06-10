local utils = require "modules.utils"

return {
  -- DAP
  {
    "mfussenegger/nvim-dap",
    version = "*",
    cmd = require("configs.dap").cmd,
    keys = require("configs.dap").keys,
    config = require("configs.dap").configs,
    dependencies = {
      { -- DAP UI
        "rcarriga/nvim-dap-ui",
        version = "*",
        config = function()
          require "configs.dap-ui"
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
  },
}
