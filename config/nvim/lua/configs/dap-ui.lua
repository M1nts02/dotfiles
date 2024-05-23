local dap = require "dap"
local dapui = require "dapui"

-- auto open ui
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

require("dapui").setup {
  layouts = {
    {
      elements = {
        "scopes",
        "stacks",
        "watches",
      },
      size = 0.3,
      position = "left",
    },
    {
      elements = {
        "repl",
      },
      size = 0.25,
      position = "bottom",
    },
  },
}
