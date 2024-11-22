local M = {}

local opts = {
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
  },
}

function M.config()
  require("lazydev").setup(opts)
  local cmp = require "cmp"
  local conf = cmp.get_config()
  table.insert(conf.sources, { name = "lazydev", group_index = 0 })
  cmp.setup(conf)
end

return M
