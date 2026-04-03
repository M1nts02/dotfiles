local M = {}

M.debugpy = {
  command = "python",
  args = { "-m", "debugpy.adapter" },
  type = "executable",
}

M.lldb = {
  executable = { command = "codelldb", args = { "--port", "${port}" } },
  port = "${port}",
  type = "server",
  name = "lldb",
}

return M
