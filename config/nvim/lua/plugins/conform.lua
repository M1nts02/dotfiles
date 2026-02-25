local M = {
  "stevearc/conform.nvim",
  event = "VeryLazy",
}

-- Toggle format
vim.api.nvim_create_user_command("FormatToggle", function()
  vim.g.enable_autoformat = not vim.g.enable_autoformat
  Cache.update { g = { enable_autoformat = vim.g.enable_autoformat } }
end, {
  desc = "Toggle format",
})

function M.config()
  vim.g.zig_fmt_autosave = 0
  require("conform").setup {
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
      if vim.g.enable_autoformat ~= true then
        return
      end
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end,
  }
end

return M
