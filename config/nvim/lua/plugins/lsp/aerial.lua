local M = {}

M.cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle", "AerialNavOpen" }

M.keys = {
  { "<Space>ls", "<CMD>Telescope aerial<CR>", desc = "Symbols" },
  { "gs", "<CMD>Telescope aerial<CR>", desc = "Symbols" },
}

function M.config()
  require("aerial").setup { backends = { "markdown", "treesitter", "lsp", "asciidoc", "man" } }
  require("telescope").load_extension "aerial"
end

return M
