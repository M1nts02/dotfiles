local M = {}

M.keys = {
  { "<Space>f<CR>", "<CMD>Telescope builtin<CR>", desc = "Builtin" },
  { "<Space>ff", "<CMD>Telescope find_files<CR>", desc = "File" },
  { "<Space>fo", "<CMD>Telescope oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
  { "<Space>lS", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "Symbol Workspace" },
  { "<Space>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
  { "<Space>fc", "<CMD>Telescope commands<CR>", desc = "Commands" },
  { "<Space>/", "<CMD>Telescope current_buffer_fuzzy_find<CR>", desc = "Line" },
}

M.opts = {
  defaults = {
    preview = false,
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
    live_grep = { preview = true, layout_config = { width = 0.85, height = 0.85 } },
    lsp_workspace_symbols = { preview = true, layout_config = { width = 0.85, height = 0.85 } },
  },
}

return M
