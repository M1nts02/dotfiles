local M = {}

local get_hl = require("modules.utils").get_hl

--- Get colors
---@return string[]
M.get_hl = function(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end
local setup_colors = function()
  return {
    bg = get_hl("Normal").bg or (vim.o.background == "dark" and "#1E1E2E" or "#fafafa"),
    bg1 = get_hl("Pmenu").bg or (vim.o.background == "dark" and "#303446" or "#e6e9ef"),
    bg2 = get_hl("PmenuSel").bg or (vim.o.background == "dark" and "#45475a" or "#dce0e8"),
    fg = get_hl("Normal").fg,
    fg1 = get_hl("comment").fg,
    fg2 = get_hl("TabLine").fg,
    red = get_hl("DiagnosticError").fg,
    indian_red = get_hl("Identifier").fg,
    dark_red = get_hl("DiffDelete").bg,
    green = get_hl("String").fg,
    blue = get_hl("Function").fg,
    gray = get_hl("NonText").fg,
    orange = get_hl("Constant").fg,
    purple = get_hl("Statement").fg,
    pink = get_hl("SpecialComment").fg,
    cyan = get_hl("Special").fg,
    diag_warn = get_hl("DiagnosticWarn").fg,
    diag_error = get_hl("DiagnosticError").fg,
    diag_hint = get_hl("DiagnosticHint").fg,
    diag_info = get_hl("DiagnosticInfo").fg,
    git_del = get_hl("diffDeleted").fg,
    git_add = get_hl("diffAdded").fg,
    git_change = get_hl("diffChanged").fg,
  }
end

M.config = function()
  local utils = require "heirline.utils"

  require("heirline").load_colors(setup_colors)

  require("heirline").setup {
    statusline = require "configs.heirline.statusline",
    statuscolumn = require "configs.heirline.statuscolumn",
    winbar = require "configs.heirline.winbar",
    opts = {
      disable_winbar_cb = function(args)
        return require("heirline.conditions").buffer_matches({
          buftype = { "nofile", "prompt", "help", "quickfix" },
          filetype = { "^git.*", "fugitive", "Trouble", "dashboard", "buffer_manager" },
          bufname = { "sh", "term:*", "COMMIT_EDITMSG", "cmd.EXE" },
        }, args.buf)
      end,
    },
  }

  vim.api.nvim_create_augroup("Heirline", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      utils.on_colorscheme(setup_colors)
    end,
    group = "Heirline",
  })
end

return M
