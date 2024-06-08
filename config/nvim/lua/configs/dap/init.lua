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

function M.configs()
  require "configs.dap.configurations" -- Load configurations
  require "configs.dap.adapters" -- Load adapters
  require "configs.dap.options"
end

return M
