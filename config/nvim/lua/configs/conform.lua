local M = {}

local opts = {
  formatters_by_ft = {
    c = { "clang_format" },
    cpp = { "clang_format" },
    css = { "prettier" },
    gdscript = { "gdformat" },
    graphql = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { { "jq", "prettier" } },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { { "isort", "black" } },
    rust = { "rustfmt" },
    svelte = { "prettier" },
    typescriptreact = { "prettier" },
    typescript = { "prettier" },
    yaml = { "prettier" },
    zig = { "zigfmt" },
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 1000, lsp_fallback = true }
  end,
}

-- Disable auto format
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

-- Enable auto format
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

function M.init()
  vim.g.zig_fmt_autosave = 0
  vim.g.disable_autoformat = false -- Enable auto format
end

function M.config()
  require("conform").setup(opts) -- Options
end

return M
