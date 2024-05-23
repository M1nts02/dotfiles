local M = {}

local opts = {
  ensure_installed = { "c", "lua", "markdown", "nu", "org", "query", "ron", "vim", "vimdoc" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = false, additional_vim_regex_highlighting = false },
}

M.cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate" }

M.init = function()
  -- Enable highlight
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*.kdl", "*.md", "*.nu", "*.ron", "*.toml", "*.yaml" },
    command = "TSBufEnable highlight",
  })
end

M.config = function()
  require("nvim-treesitter.configs").setup(opts)
end

return M
