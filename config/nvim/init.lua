local sysname = vim.uv.os_uname().sysname
_G.isMac = sysname:find "Darwin" ~= nil
_G.isLinux = sysname:find "Linux" ~= nil
_G.isWindows = sysname:find "Windows_NT" ~= nil
_G.isGui = vim.g.neovide == true
_G.ConfPath = vim.fn.stdpath "config"
_G.CachePath = ConfPath .. "/.cache.json"

_G.Utils = require "core.utils"
_G.Cache = require "core.cache"
_G.Pack = require "core.pack"
_G.Color = require "colorscheme"

require "core.options" -- Load options
Cache.load() -- Load saved options

require "core.command"
require "core.autocmd"
require "core.mapping"
require "statusline"
require "tabline"
-- require "config.completion"
require "core.gui"
Pack.load()
