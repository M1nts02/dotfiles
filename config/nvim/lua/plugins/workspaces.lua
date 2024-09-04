return {
  "natecraddock/workspaces.nvim",
  cmd = {
    "WorkspacesAdd",
    "WorkspacesAddDir",
    "WorkspacesList",
    "WorkspacesListDirs",
    "WorkspacesOpen",
    "WorkspacesRemove",
    "WorkspacesRemoveDir",
    "WorkspacesRename",
    "WorkspacesSyncDirs",
  },
  keys = {
    {
      "<Space>fw",
      "<CMD>Telescope workspaces<CR>",
      desc = "Workspace",
    },
  },
  config = function()
    require("workspaces").setup()
    require("telescope").load_extension "workspaces"
  end,
  dependencies = { "nvim-telescope/telescope.nvim" },
}
