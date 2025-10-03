local keys = {
  { "<Space>f<CR>", "<CMD>Telescope builtin<CR>", desc = "Builtin" },
  { "<Space>ff", "<CMD>Telescope fd<CR>", desc = "Fd" },
  { "<Space>fo", "<CMD>Telescope oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
  { "<Space>fc", "<CMD>Telescope commands<CR>", desc = "Commands" },
  { "<Space>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
  { "<Space>fm", "<CMD>Telescope marks<CR>", desc = "Marks" },
  { "<Space>fw", "<CMD>Telescope workspaces<CR>", desc = "Workspace" },
  { "<Space>b", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
  { "<Space>/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Line" },
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
        i = {
          ["<C-x>"] = "delete_buffer",
        },
      },
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  event = { "VeryLazy" },
  keys = keys,
  opts = opts,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- Workspace
      "natecraddock/workspaces.nvim",
      config = function()
        require("workspaces").setup()
        require("telescope").load_extension "workspaces"
      end,
    },
    { -- Session
      "olimorris/persisted.nvim",
      config = function()
        require("persisted").setup()
        require("telescope").load_extension "persisted"
      end,
    },
  },
}
