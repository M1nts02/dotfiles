local opts = {
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    gdscript = { "gdformat" },
    javascript = { "biome" },
    json = { "jq" },
    lua = { "stylua" },
    markdown = { "mdformat" },
    python = { "ruff_format", "isort", "black", stop_after_first = true },
    rust = { "rustfmt", lsp_format = "fallback" },
    typescript = { "biome" },
    yaml = { "yamlfmt" },
    zig = { "zigfmt" },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat == true then
      return
    end
    return { timeout_ms = 1000, lsp_format = "fallback" }
  end,
}

return {
  "stevearc/conform.nvim",
  cmd = { "AutoformatToggle" },
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("conform").setup(opts)
  end,
}
