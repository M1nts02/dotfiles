return {
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require "plugins.lspconfig.lspconfig"
    require "plugins.lspconfig.options"
  end,
}
