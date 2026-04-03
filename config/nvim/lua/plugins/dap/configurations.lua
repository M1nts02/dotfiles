local M = {}

M.python = {
  {
    program = "${file}",
    pythonPath = "python",
    type = "debugpy",
    console = "integratedTerminal",
    request = "launch",
    name = "Launch file",
  },
}

M.cpp = {
  {
    stopOnEntry = false,
    cwd = "${workspaceFolder}",
    name = "Launch",
    type = "lldb",
    request = "launch",
    console = "integratedTerminal",
    program = function()
      return vim.fn.input {
        prompt = "Path to executable: ",
        completion = "file",
      }
    end,
  },
}
M.c = M.cpp
M.rust = M.cpp
M.zig = M.cpp

return M
