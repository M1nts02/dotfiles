local M = {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  enabled = Utils.executable { "gcc", "clang", "zig", "cc", "cl" },
  build = ":TSUpdate",
  event = { "BufRead", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate" },
}

function M.init()
  -- Enable highlight
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*.md", "*.ron", "*.toml", "*.yaml" },
    command = "TSBufEnable highlight",
  })
end

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "c",
      "cpp",
      "json",
      "lua",
      "markdown",
      "query",
      "ron",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
      "zig",
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = false, additional_vim_regex_highlighting = false },
  }
end

return M
