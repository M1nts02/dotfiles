local M = {}

function M.options()
  local cmp = require "cmp"
  return {
    {
      type = "/",
      enabled = true,
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
      enabled = true,
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

return M
