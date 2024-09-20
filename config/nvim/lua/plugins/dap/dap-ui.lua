local dap = require "dap"
local dapui = require "dapui"

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

require("dapui").setup {
  controls = {
    element = "repl",
    enabled = true,
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "rounded",
  },
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.4,
        },
        {
          id = "watches",
          size = 0.3,
        },
        {
          id = "console",
          size = 0.3,
        },
      },
      position = "left",
      size = 40,
    },
    {
      elements = {
        {
          id = "repl",
          size = 1,
        },
      },
      position = "bottom",
      size = 10,
    },
  },
}

vim.api.nvim_create_user_command("DapUIBreakpoints", function()
  require("dapui").float_element("breakpoints", {
    position = "center",
    enter = true,
    height = math.floor(vim.opt.lines:get() * 0.7),
    width = math.floor(vim.opt.columns:get() * 0.7),
  })
end, {
  desc = "Open Breakpoints",
})

vim.api.nvim_create_user_command("DapUIStacks", function()
  require("dapui").float_element("stacks", {
    position = "center",
    enter = true,
    height = math.floor(vim.opt.lines:get() * 0.7),
    width = math.floor(vim.opt.columns:get() * 0.7),
  })
end, {
  desc = "Open Stacks",
})
