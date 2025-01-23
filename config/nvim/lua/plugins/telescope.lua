local keys = {
  { "<Space>f<CR>", "<CMD>Telescope builtin<CR>", desc = "Builtin" },
  { "<Space>ff", "<CMD>Telescope fd<CR>", desc = "Fd" },
  { "<Space>fo", "<CMD>Telescope oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
  { "<Space>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
  { "<Space>fq", "<CMD>Telescope quickfix<CR>", desc = "Quickfix" },
  { "<Space>fm", "<CMD>Telescope marks<CR>", desc = "Marks" },
  { "<Space>fg", "<CMD>Telescope live_grep<CR>", desc = "Grep" },
  { "<Space>fw", "<CMD>Telescope workspaces<CR>", desc = "Workspace" },
  { "<Space>lh", "<CMD>Telescope lsp_references<CR>", desc = "References" },
  { "<Space>lo", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "Outgoing Calls" },
  { "<Space>b", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
  { "<Space>/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Line" },
  { "gd", "<CMD>Telescope lsp_definitions<CR>", desc = "Definition" },
}

local opts = {
  defaults = {
    preview = false,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "-l",
    },
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.6,
      height = 0.7,
    },
  },
  pickers = {
    live_grep = { preview = true, layout_config = { width = 0.9, height = 0.9 } },
    lsp_workspace_symbols = { preview = true, layout_config = { width = 0.9, height = 0.9 } },
    lsp_definitions = { preview = true, layout_config = { width = 0.9, height = 0.9 } },
    lsp_references = { preview = true, layout_config = { width = 0.9, height = 0.9 } },
    diagnostics = { preview = true, layout_config = { width = 0.9, height = 0.9 } },
    quickfix = { preview = true, layout_config = { width = 0.9, height = 0.9 } },
    marks = { preview = true, layout_config = { width = 0.9, height = 0.9 } },
    buffers = {
      mappings = {
        n = {
          ["d"] = "delete_buffer",
        },
      },
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  cmd = { "Telescope" },
  keys = keys,
  opts = opts,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- Workspace
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
      config = function()
        require("telescope").load_extension "workspaces"
      end,
    },
    { -- Session
      "olimorris/persisted.nvim",
      cmd = {
        "SessionToggle",
        "SessionStart",
        "SessionStop",
        "SessionSave",
        "SessionSelect",
        "SessionLoad",
        "SessionLoadLast",
        "SessionLoadFromFile",
        "SessionDelete",
      },
      config = function()
        require("telescope").load_extension "persisted"
      end,
    },
  },
}
