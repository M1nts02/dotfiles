local M = {}

M.keys = {
  { "<Space>fw", "<CMD>WorkspacesOpen<CR>", desc = "Workspace" },
}

M.cmd = {
  "WorkspacesAdd",
  "WorkspacesAddDir",
  "WorkspacesList",
  "WorkspacesListDirs",
  "WorkspacesOpen",
  "WorkspacesRemove",
  "WorkspacesRemoveDir",
  "WorkspacesRename",
  "WorkspacesSyncDirs",
}

M.opts = {
  path = vim.fn.stdpath "data" .. "/workspaces",
  cd_type = "global",
  sort = true,
  mru_sort = true,
  notify_info = true,
  hooks = {},
}

return M
