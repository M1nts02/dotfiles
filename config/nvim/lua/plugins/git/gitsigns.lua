local M = {}

M.keys = {
  {
    "<Space>gb",
    "<CMD>Gitsigns toggle_current_line_blame<CR>",
    desc = "Line blame",
  },
  {
    "<Space>gh",
    "<CMD>Gitsigns preview_hunk<CR>",
    desc = "Preview hunk",
  },
  {
    "<Space>gt",
    "<CMD>Gitsigns toggle_signs<CR>",
    desc = "Toggle gitsigns",
  },
}

M.opts = {
  signcolumn = true,
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
}

return M
