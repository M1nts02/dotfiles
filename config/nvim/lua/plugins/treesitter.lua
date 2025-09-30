local utils = require "modules.utils"

return {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  enabled = utils.executable { "gcc", "clang", "zig", "cc", "cl" },
  build = ":TSUpdate",
  event = { "BufRead", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate" },
  init = function()
    -- Enable highlight
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = { "*.kdl", "*.md", "*.ron", "*.toml", "*.yaml" },
      command = "TSBufEnable highlight",
    })
  end,
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "lua", "markdown", "query", "ron", "vim", "vimdoc" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = false, additional_vim_regex_highlighting = false },
    }
  end,
}
