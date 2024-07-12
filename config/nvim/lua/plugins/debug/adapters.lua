local utils = require "modules.utils"
local dap = require "dap"

local function lldb()
  if utils.executable "codelldb" then
    return "codelldb"
  end

  if utils.executable "lldb-dap" then
    return "lldb-dap"
  end

  if utils.executable "lldb-vscode" then
    return "lldb-vscode"
  end
end

-- Adapters
local M = {}

-- debugpy
M.python = {
  type = "executable",
  command = vim.g.python,
  args = { "-m", "debugpy.adapter" },
}

-- lldb
M.codelldb = {
  type = "server",
  name = "lldb",
  port = "${port}",
  executable = {
    command = lldb(),
    args = { "--port", "${port}" },
  },
}

for k, v in pairs(M) do
  dap.adapters[k] = v
end
