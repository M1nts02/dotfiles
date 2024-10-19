local M = {}

function M.config()
  local cmp = require "cmp"
  cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    enabled = true,
    completion = { keyword_length = 2 },
    sources = { { name = "dap" } },
  })
end

return M
