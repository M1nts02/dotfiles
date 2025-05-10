local utils = require "modules.utils"
local setmap = utils.setmap
local telescope = require "telescope"

require("workspaces").setup()
require("persisted").setup()

telescope.setup {
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

telescope.load_extension "workspaces"
telescope.load_extension "persisted"
telescope.load_extension "cmdline"

setmap {
  { { "n" }, "<Space>f<CR>", "<CMD>Telescope builtin<CR>", { noremap = true, desc = "Builtin" } },
  { { "n" }, "<Space>ff", "<CMD>Telescope fd<CR>", { noremap = true, desc = "Fd" } },
  { { "n" }, "<Space>fo", "<CMD>Telescope oldfiles<CR>", { noremap = true, desc = "Oldfile" } },
  { { "n" }, "<Space>fb", "<CMD>Telescope buffers<CR>", { noremap = true, desc = "Buffers" } },
  { { "n" }, "<Space>fh", "<CMD>Telescope help_tags<CR>", { noremap = true, desc = "Help" } },
  { { "n" }, "<Space>fm", "<CMD>Telescope marks<CR>", { noremap = true, desc = "Marks" } },
  { { "n" }, "<Space>fw", "<CMD>Telescope workspaces<CR>", { noremap = true, desc = "Workspace" } },
  { { "n" }, "<Space>c", "<CMD>Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" } },
  { { "n" }, "<Space>b", "<CMD>Telescope buffers<CR>", { noremap = true, desc = "Buffers" } },
  { { "n" }, "<Space>/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", { noremap = true, desc = "Line" } },
}
