return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1,
  config = function()
    require("catppuccin").setup {
      term_colors = true,
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "undercurl" },
        },
      },
    }

    vim.g.dark_theme = "catppuccin-mocha"
    vim.g.light_theme = "catppuccin-latte"

    Color.dark_mode(vim.g.dark)
    Color.set_hl()
  end,
}
