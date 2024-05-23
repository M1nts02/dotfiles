local M = {}

M.keys = {
  { "<Space>gg", "<CMD>Gitsigns toggle_signs<CR>", desc = "Gitsigns" },
  { "<Space>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>", desc = "Gitsigns blame" },
  { "<Space>gd", "<CMD>Gitsigns diffthis<CR>", desc = "Diff" },
  { "<Space>g<Cr>", "<CMD>Gitsigns refresh<CR>", desc = "Gitsigns refresh" },
}

M.opts = {
  signcolumn = true,
}

return M
