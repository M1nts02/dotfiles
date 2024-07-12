-- Options
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

require("dap.ext.vscode").load_launchjs(nil, { lldb = { "cc", "cpp", "c", "rs", "zig" } })
