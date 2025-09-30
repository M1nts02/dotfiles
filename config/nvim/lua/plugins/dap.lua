return {
  "mfussenegger/nvim-dap",
  event = { "VeryLazy" },
  dependencies = { "miroshQa/debugmaster.nvim", "M1nts02/nvim-menu" },
  config = function()
    local utils = require "modules.utils"
    local executable = utils.executable
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
  end,
}
