local keys = {
  {
    "<Space>ls",
    "<CMD>AerialToggle<CR>",
    desc = "Symbol",
  },
}

local opts = {
  backends = { "markdown", "lsp", "treesitter", "man" },
  layout = {
    max_width = 0.3,
    min_width = 0.2,
    default_direction = "right",
    placement = "edge",
  },
}

return {
  "stevearc/aerial.nvim",
  keys = keys,
  opts = opts,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
