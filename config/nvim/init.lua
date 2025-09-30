local os_name = jit.os
vim.g.is_mac = os_name:find "OSX" ~= nil
vim.g.is_linux = os_name:find "Linux" ~= nil
vim.g.is_windows = os_name:find "Windows" ~= nil

vim.g.lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
vim.g.confpath = vim.fn.stdpath "config"

require "modules.load_custom" -- Custom options
require "modules.options" -- Options
require("modules.cache").load() -- Save options

-- Don't load shada
local shada = vim.o.shada
vim.o.shada = ""

-- Check plugin manager
if not vim.uv.fs_stat(vim.g.lazypath) then
  print "Downloading ..."
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    vim.g.lazypath,
  }
end

-- Load lazy.nvim
vim.opt.runtimepath:prepend(vim.g.lazypath)

require("lazy").setup({
  -- Plugins manager
  { "folke/lazy.nvim", version = "*" },

  -- Load plugins
  { import = "plugins" },

  -- Lazy-load
  {
    name = "lazy-load",
    dir = vim.g.confpath,
    event = "VeryLazy",
    config = function()
      -- Load shada
      vim.o.shada = shada
      pcall(vim.cmd.rshada, { bang = true })
      -- Load mapping
      require "modules.mapping"
    end,
  },
}, { -- Lazy.nvim config
  ui = {
    border = "rounded",
    backdrop = 100,
  },
})
