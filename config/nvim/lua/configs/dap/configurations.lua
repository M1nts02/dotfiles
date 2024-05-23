local dap = require "dap"

-- Configurations
local M = {}

M.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = vim.g.python,
    console = "integratedTerminal",
  },
}

M.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input "Path to executable: "
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

M.c = M.cpp
M.rust = M.cpp
M.zig = M.cpp

for k, v in pairs(M) do
  dap.configurations[k] = v
end
