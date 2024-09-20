local dap = require "dap"

-- Configurations
local M = {}

M.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = "python",
    console = "integratedTerminal",
  },
}

M.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    console = "integratedTerminal",
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
