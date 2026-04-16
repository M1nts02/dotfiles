return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require "conform"
    conform.setup {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        javascript = { "biome" },
        json = { "jq" },
        lua = { "stylua" },
        markdown = { "mdformat" },
        python = { "ruff_format", "isort", "black", stop_after_first = true },
        sql = { "sqruff" },
        typescript = { "biome" },
        zig = { "zigfmt" },
      },
    }

    Utils.setmap { { "n", "<Leader>F", function() conform.format { async = true, lsp_format = "fallback" } end, { desc = "Format" } } }
  end,
}
