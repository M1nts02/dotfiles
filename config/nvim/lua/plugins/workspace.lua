local keys = { { "<Space>fw", "<CMD>WorkspacesOpen<CR>", desc = "Workspace" } }

local cmd = {
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

return {
  "natecraddock/workspaces.nvim",
  cmd = cmd,
  keys = keys,
  opts = {},
}
