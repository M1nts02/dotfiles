local utils = require "modules.utils"
local executable = utils.executable
local dap = require "dap"

-- Adapters
local M = {}

-- debugpy
M.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

-- lldb
M.codelldb = {
  type = "server",
  name = "lldb",
  port = "${port}",
  executable = {
    command = executable "codelldb" and "codelldb" or "lldb-dap",
    args = { "--port", "${port}" },
  },
}

for k, v in pairs(M) do
  dap.adapters[k] = v
end
