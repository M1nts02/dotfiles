local sysname = vim.uv.os_uname().sysname
_G.isMac = sysname:find "Darwin" ~= nil
_G.isLinux = sysname:find "Linux" ~= nil
_G.isWindows = sysname:find "Windows_NT" ~= nil
_G.ConfPath = vim.fn.stdpath "config"
_G.CachePath = ConfPath .. "/.cache.json"

_G.Utils = require("utils")
_G.Cache = require("cache")
_G.Color = require("colorscheme")

require "options" -- Load options
Cache.load()      -- Load saved options

require "command"
require "autocmd"
require "mapping"
require "menu"
require "statusline"

require("pack").load() -- Load Plugins
