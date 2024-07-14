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

local cmd = {
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
  "DapUIToggle",
}

local keys = {
  { "<F5>", "<CMD>DapContinue<CR>" },
  { "<F9>", "<CMD>DapToggleBreakpoint<CR>" },
  { "<F10>", "<CMD>DapStepOver<CR>" },
  { "<F11>", "<CMD>DapStepInto<CR>" },
}

local function config()
  require "plugins.dap.configurations" -- Load configurations
  require "plugins.dap.adapters" -- Load adapters
  require("dap.ext.vscode").load_launchjs(nil, {
    lldb = { "cc", "cpp", "c", "rs", "zig" },
  })
end

return {
  "mfussenegger/nvim-dap",
  version = "*",
  cmd = cmd,
  keys = keys,
  config = config,
}
