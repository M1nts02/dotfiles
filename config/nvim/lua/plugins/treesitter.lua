local utils = require "modules.utils"

local opts = {
  ensure_installed = { "c", "lua", "markdown", "org", "query", "ron", "vim", "vimdoc" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = false, additional_vim_regex_highlighting = false },
}

local function init()
  -- Enable highlight
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*.kdl", "*.md", "*.ron", "*.toml", "*.yaml" },
    command = "TSBufEnable highlight",
  })
end

local function config()
  require("nvim-treesitter.configs").setup(opts)
end

return {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  enabled = utils.executable { "gcc", "clang", "zig", "cc", "cl" },
  build = ":TSUpdate",
  event = { "BufRead", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate" },
  init = init,
  config = config,
}
