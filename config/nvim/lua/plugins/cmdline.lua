local options = function()
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

return {
  "hrsh7th/cmp-cmdline",
  keys = { ":", "/", "?" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path", -- Path
    "hrsh7th/cmp-buffer", -- Buffer
  },
  opts = options,
  config = function(_, opts)
    local cmp = require "cmp"
    vim.tbl_map(function(val)
      cmp.setup.cmdline(val.type, val)
    end, opts)
  end,
}
