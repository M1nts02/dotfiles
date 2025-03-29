local M = {}

vim.fn.sign_define("DapBreakpoint", {
  text = "⊚",
  texthl = "LspDiagnosticsSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("Dapstooped", {
  text = "❀",
  texthl = "LspDiagnosticsSignHint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "▷",
  texthl = "LspDiagnosticsSignInformation",
  linehl = "DiagnosticUnderlineInfo",
  numhl = "LspDiagnosticsSignInformation",
})

M.cmd = {
  "DapContinue",
  "DapLoadLaunchJSON",
  "DapRestartFrame",
  "DapSetLogLevel",
  "DapShowLog",
  "DapStepInto",
  "DapStepOut",
  "DapStepOver",
  "DapTerminate",
  "DapToggleBreakpoint",
  "DapToggleRepl",
}

M.keys = {
  {
    "<F5>",
    function()
      require("dap").continue()
    end,
    desc = "Debug:Continue",
  },
  {
    "<F9>",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Debug:Toggle Breakpoint",
  },
  {
    "<F10>",
    function()
      require("dap").step_over()
    end,
    desc = "Debug:Step Over",
  },
  {
    "<F11>",
    function()
      require("dap").step_into()
    end,
    desc = "Debug:Step Into",
  },
}

function M.config()
  require "plugins.dap.configurations" -- Load configurations
  require "plugins.dap.adapters" -- Load adapters
end

return M
