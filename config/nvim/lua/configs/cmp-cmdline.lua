local M = {}

M.opts = function()
  local cmp = require "cmp"
  return {
    {
      type = "/",
      mapping = cmp.mapping.preset.cmdline {
        ["<C-n>"] = {
          c = function(fallback)
            fallback()
          end,
        },
        ["<C-p>"] = {
          c = function(fallback)
            fallback()
          end,
        },
      },
      sources = { { name = "buffer" } },
    },
    {
      type = { ":", "@" },
      mapping = cmp.mapping.preset.cmdline {
        ["<C-n>"] = {
          c = function(fallback)
            fallback()
          end,
        },
        ["<C-p>"] = {
          c = function(fallback)
            fallback()
          end,
        },
      },
      sources = cmp.config.sources(
        { { name = "path" } },
        { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
      ),
    },
  }
end

function M.config(_, opts)
  local cmp = require "cmp"
  vim.tbl_map(function(val)
    cmp.setup.cmdline(val.type, val)
  end, opts)
end

return M
