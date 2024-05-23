local os_name = jit.os
vim.g.is_mac = os_name:find "OSX" ~= nil
vim.g.is_linux = os_name:find "Linux" ~= nil
vim.g.is_windows = os_name:find "Windows" ~= nil

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local confpath = vim.fn.stdpath "config"

-- Load custom.lua
local result = require "modules.load_custom"

if not result then
  return
end

-- Load options
require "modules.options"

-- Don't load shada
local shada = vim.o.shada
vim.o.shada = ""

-- Check plugin manager
if not vim.loop.fs_stat(lazypath) then
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
    dir = confpath,
    event = "VeryLazy",
    config = function()
      -- Load shada
      vim.o.shada = shada
      pcall(vim.cmd.rshada, { bang = true })
      -- Load mapping
      require "modules.commands"
      require "modules.mapping"
    end,
  },
}, { -- Lazy.nvim config
  ui = {
    border = "rounded",
    backdrop = 100,
  },
})

-- Highlights
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = function()
    local highlight = require "modules.highlight"
    local palette = highlight.get_palette()
    highlight.set_groups(palette)
  end,
})
