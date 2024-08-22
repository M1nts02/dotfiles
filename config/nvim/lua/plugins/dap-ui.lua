local utils = require "modules.utils"

local function config()
  local dap = require "dap"
  local dapui = require "dapui"

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
    pcall(vim.cmd, "windo LspStop")
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
    pcall(vim.cmd, "windo LspStop")
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
    pcall(vim.cmd, "windo LspStart")
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
    pcall(vim.cmd, "windo LspStart")
  end

  require("dapui").setup {}
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      version = "*",
      config = config,
      dependencies = {
        "nvim-neotest/nvim-nio",
        {
          "theHamsta/nvim-dap-virtual-text",
          enabled = utils.executable { "gcc", "clang", "zig", "cc", "cl" },
          opts = {
            virt_text_pos = "eol",
          },
        },
      },
    },
  },
}
