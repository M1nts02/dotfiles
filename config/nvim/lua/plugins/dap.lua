-- Configurations
local configurations = {
  python = {
    {
      program = "${file}",
      pythonPath = "python",
      type = "debugpy",
      console = "integratedTerminal",
      request = "launch",
      name = "Launch file",
    },
  },
  cpp = {
    {
      stopOnEntry = false,
      cwd = "${workspaceFolder}",
      name = "Launch",
      type = "lldb",
      request = "launch",
      console = "integratedTerminal",
      program = function()
        return vim.fn.input { prompt = "Path to executable: ", completion = "file" }
      end,
    },
  },
}

configurations.c = configurations.cpp
configurations.rust = configurations.cpp
configurations.zig = configurations.cpp

-- Adapters
local adapters = {
  debugpy = {
    command = "python",
    args = { "-m", "debugpy.adapter" },
    type = "executable",
  },
  lldb = {
    executable = { command = "codelldb", args = { "--port", "${port}" } },
    port = "${port}",
    type = "server",
    name = "lldb",
  },
}

return {
  "mfussenegger/nvim-dap",
  dependencies = { "miroshQa/debugmaster.nvim" },
  config = function()
    local dap = require "dap"
    for k, v in pairs(adapters) do
      dap.adapters[k] = v
    end
    for k, v in pairs(configurations) do
      dap.configurations[k] = v
    end
    Utils.setmap { { "nv", "<Leader>d", require("debugmaster").mode.toggle, { desc = "Debug Mode" } } }
    -- Statuscol
    _G.dap_toggle_breakpoint = function()
      vim.cmd "DapToggleBreakpoint"
    end
    vim.o.statuscolumn = "%@v:lua.dap_toggle_breakpoint@%s%T%l "
  end,
}
