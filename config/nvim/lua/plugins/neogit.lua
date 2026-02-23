local M = { "NeogitOrg/neogit" }

M.cmd = { "Neogit" }

M.opts = {
  graph_style = "kitty",
  commit_editor = { staged_diff_split_kind = "auto", spell_check = false },
}

if vim.g.neovide then
  M.opts.graph_style = nil
end

M.dependencies = { "nvim-lua/plenary.nvim" }

return M
