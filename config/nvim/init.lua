local sysname = vim.uv.os_uname().sysname
_G.isMac = sysname:find "Darwin" ~= nil
_G.isLinux = sysname:find "Linux" ~= nil
_G.isWindows = sysname:find "Windows_NT" ~= nil
_G.ConfPath = vim.fn.stdpath "config"
_G.Utils = require "modules.utils"
_G.Cache = require "modules.cache"

-- Load options
require "modules.options"
-- Load saved options
Cache.load()

-- Check plugin manager
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  print "Downloading ..."
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

-- Load lazy.nvim
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  -- Plugins manager
  { "folke/lazy.nvim", version = "*" },

  -- Load plugins
  { import = "plugins" },

  -- Lazy-load
  {
    name = "lazy-load",
    dir = ConfPath,
    event = "VeryLazy",
    config = function()
      require "modules.mapping"
    end,
  },
}, { -- Lazy.nvim config
  ui = {
    border = "rounded",
    backdrop = 100,
  },
  change_detection = {
    notify = false,
  },
})
