local keys = {
  { "<Space>f<CR>", "<CMD>Telescope builtin<CR>", desc = "Builtin" },
  { "<Space>fo", "<CMD>Telescope oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
  { "<Space>fh", "<CMD>Telescope help_tags<CR>", desc = "Help" },
  { "<Space>fc", "<CMD>Telescope commands<CR>", desc = "Commands" },
  { "<Space>fq", "<CMD>Telescope quickfix<CR>", desc = "Quickfix" },
  { "<Space>fg", "<CMD>Telescope live_grep<CR>", desc = "Grep" },
  { "<Space>lh", "<CMD>Telescope lsp_references<CR>", desc = "References" },
  { "<Space>lo", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "Outgoing Calls" },
  { "go", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "Outgoing Calls" },
  { "gd", "<CMD>Telescope lsp_definitions<CR>", desc = "Definition" },
  { "gh", "<CMD>Telescope lsp_references<CR>", desc = "References" },
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
  },
}
