local M = { "NeogitOrg/neogit" }

M.cmd = { "Neogit" }

M.opts = {
  integrations = { fzf_lua = true },
  graph_style = "kitty",
  commit_editor = { staged_diff_split_kind = "auto", spell_check = false },
}

M.dependencies = { "nvim-lua/plenary.nvim" }

return M
