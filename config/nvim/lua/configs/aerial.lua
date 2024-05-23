local M = {}

M.keys = {
  {
    "<Space>ls",
    "<CMD>AerialToggle<CR>",
    desc = "Symbol",
  },
}

M.opts = {
  backends = { "markdown", "lsp", "treesitter", "man" },
  layout = {
    max_width = 0.3,
    min_width = 0.2,
    default_direction = "right",
    placement = "edge",
  },
}

return M
