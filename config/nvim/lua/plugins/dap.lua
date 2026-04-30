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
  sh = {
    {
      name = "Launch Bash debugger",
      type = "bashdb",
      request = "launch",
      program = "${file}",
      cwd = "${fileDirname}",
      pathBashdb = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
      pathBashdbLib = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
      pathBash = "bash",
      pathCat = "cat",
      pathMkfifo = "mkfifo",
      pathPkill = "pkill",
      env = {},
      args = {},
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
  bashdb = {
    type = "executable",
    command = "bash-debug-adapter",
    name = "bashdb",
  },
}

return {
  "mfussenegger/nvim-dap",
  dependencies = { "igorlfs/nvim-dap-view" },
  config = function()
    local dap = require "dap"
    local dap_view = require "dap-view"
    for k, v in pairs(adapters) do
      dap.adapters[k] = v
    end
    for k, v in pairs(configurations) do
      dap.configurations[k] = v
    end

    dap_view.setup()

    -- Statuscol
    _G.dap_toggle_breakpoint = function() vim.cmd "DapToggleBreakpoint" end
    vim.o.statuscolumn = "%@v:lua.dap_toggle_breakpoint@%s%T%l "

    Utils.setmap {
      { "nivt", "<F5>", dap.continue, { desc = "Debug: Continue/Start" } },
      { "nivt", "<F10>", dap.step_over, { desc = "Debug: Step Over" } },
      { "nivt", "<F11>", dap.step_into, { desc = "Debug: Step Into" } },
      { "nivt", "<S-F11>", dap.step_out, { desc = "Debug: Step Out" } },
      { "nivt", "<S-F5>", dap.terminate, { desc = "Debug: Stop" } },
      { "nivt", "<F9>", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" } },
      { "nivt", "<S-F9>", function() dap.set_breakpoint(vim.fn.input "Breakpoint condition: ") end, { desc = "Debug: Set Conditional Breakpoint" } },
      { "nivt", "<C-S-F9>", dap.clear_breakpoints, { desc = "Debug: Clear All Breakpoints" } },
      { "nivt", "<C-F5>", dap.restart, { desc = "Debug: Restart" } },
      { "nivt", "<C-S-F5>", dap.run_to_cursor, { desc = "Debug: Run to Cursor" } },
      { "nivt", "<F6>", dap.pause, { desc = "Debug: Pause" } },
      { "nivt", "<C-S-c>", dap.repl.open, { desc = "Debug: Open REPL" } },
      { "n", "<Leader>d", dap_view.toggle, { desc = "Dap View Toggle" } },
    }
  end,
}
