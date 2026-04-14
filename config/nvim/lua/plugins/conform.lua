return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
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

    vim.api.nvim_create_user_command("Conform", function() require("conform").format() end, { desc = "Format" })
    vim.api.nvim_create_user_command("ConformAll", "tabdo windo lua require('conform').format()", { desc = "Format all buffers" })
  end,
}
