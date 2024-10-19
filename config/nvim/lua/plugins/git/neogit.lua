local M = {}

M.keys = {
  {
    "<Space>gn",
    "<CMD>Neogit<CR>",
    desc = "Neogit",
  },
}

M.opts = {
  commit_editor = {
    staged_diff_split_kind = "vsplit",
  },
}

return M
