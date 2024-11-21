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
    zig = { "zigfmt", lsp_format = "fallback" },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat == true then
      return
    end
    return { timeout_ms = 1000, lsp_format = "fallback" }
  end,
}

local function formatters()
  require("conform").formatters.zigfmt = function(bufnr)
    return {
      command = "zig",
      arg = { "fmt" },
    }
  end
end

return {
  "stevearc/conform.nvim",
  cmd = { "AutoformatToggle" },
  event = { "BufRead", "BufNewFile" },
  init = function()
    vim.g.zig_fmt_autosave = 0
  end,
  config = function()
    require("conform").setup(opts)
    formatters()

    -- Toggle auto format
    vim.api.nvim_create_user_command("AutoformatToggle", function(args)
      if vim.g.disable_autoformat == true then
        vim.g.disable_autoformat = false
        vim.notify "Autoformat enabled"
      else
        vim.g.disable_autoformat = true
        vim.notify "Autoformat disabled"
      end
    end, {
      desc = "Toggle autoformat",
      bang = true,
    })
  end,
}
