local M = {
  "folke/trouble.nvim",
  version = "*",
}

M.cmd = "Trouble"

M.keys = {
  {
    "<Space>fG",
    function()
      local arg = vim.fn.input "Grep: "

      if arg == "" or arg == nil then
        return
      end

      pcall(vim.cmd, "vimgrep /" .. arg .. "/gj **")
      vim.cmd "Trouble qflist"
    end,
    desc = "Grep",
  },
  { "<Space>fq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix" },
  { "gO", "<CMD>Trouble symbols toggle<CR>", desc = "Symbols" },
  { "gd", "<CMD>Trouble lsp_definitions<CR>", desc = "Definition" },
  { "grd", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
  { "gri", "<CMD>Trouble lsp_implementations<CR>", desc = "Implementations" },
  { "gro", "<CMD>Trouble lsp_outgoing_calls toggle<CR>", desc = "Outgoing Calls" },
  { "grr", "<CMD>Trouble lsp_references toggle<CR>", desc = "References" },
  { "grt", "<CMD>Trouble lsp_type_definitions<CR>", desc = "Type Definition" },
}

M.opts = {
  focus = true,
  modes = {
    symbols = {
      focus = true,
    },
  },
}

return M
