local M = {}

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
  "DapUIToggle",
}

M.keys = {
  { "<F5>", "<CMD>DapContinue<CR>" },
  { "<F9>", "<CMD>DapToggleBreakpoint<CR>" },
  { "<F10>", "<CMD>DapStepOver<CR>" },
  { "<F11>", "<CMD>DapStepInto<CR>" },
}

function M.configs()
  require "plugins.debug.configurations" -- Load configurations
  require "plugins.debug.adapters" -- Load adapters
  require "plugins.debug.options"
end

return M
