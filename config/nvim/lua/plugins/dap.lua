local utils = require "modules.utils"
local executable = utils.executable
local setmap = utils.setmap
local dap = require "dap"

----------- Adapters --------------
local adt = {}

-- debugpy
adt.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

-- lldb
adt.lldb = {
  type = "server",
  name = "lldb",
  port = "${port}",
  executable = {
    command = executable "codelldb" and "codelldb" or "lldb-dap",
    args = { "--port", "${port}" },
  },
}

for k, v in pairs(adt) do
  dap.adapters[k] = v
end

------------ Configurations ---------------
local conf = {}
conf.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = "python",
    console = "integratedTerminal",
  },
}

conf.cpp = {
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

conf.c = conf.cpp
conf.rust = conf.cpp
conf.zig = conf.cpp

for k, v in pairs(conf) do
  dap.configurations[k] = v
end

setmap {
  { { "n" }, "<F5>", dap.continue, { noremap = true, desc = "Debug:Continue" } },
  { { "n" }, "<F9>", dap.toggle_breakpoint, { noremap = true, desc = "Debug:Toggle Breakpoint" } },
  { { "n" }, "<F10>", dap.step_over, { noremap = true, desc = "Debug:Step Over" } },
  { { "n" }, "<F11>", dap.step_into, { noremap = true, desc = "Debug:Step Into" } },
}
