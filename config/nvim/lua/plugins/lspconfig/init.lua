return {
  "neovim/nvim-lspconfig",
  event = { "BufRead", "BufNewFile" },
  init = function()
    vim.g.dianostic_virtualtext = false
    vim.g.inlay_hints = true
  end,
  config = function()
    require "plugins.lspconfig.lspconfig"
    require "plugins.lspconfig.options"
  end,
}
