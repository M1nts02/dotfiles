local M = {}

local function get_color_hl(group)
  return vim.api.nvim_get_hl(0, { name = group })
end

function M.dark_mode(mode)
  vim.g.dark = mode or false

  Cache.update { g = { dark = vim.g.dark } }
  if vim.g.dark == true then
    vim.cmd.colorscheme(vim.g.dark_theme)
  else
    vim.cmd.colorscheme(vim.g.light_theme)
  end
end

function M.get_hl()
  return {
    bg = get_color_hl("Normal").bg,
    bg1 = get_color_hl("CursorLine").bg,
    fg = get_color_hl("Normal").fg,
    red = get_color_hl("ErrorMsg").fg,
    green = get_color_hl("String").fg,
    cyan = get_color_hl("Character").fg,
    blue = get_color_hl("Function").fg,
    grey = get_color_hl("Comment").fg,
    yellow = get_color_hl("Type").fg,
    pink = get_color_hl("Special").fg,
  }
end

function M.set_hl()
  local colors = M.get_hl()
  local bg = colors.bg
  local bg1 = colors.bg1
  local fg = colors.fg
  local red = colors.red
  local green = colors.green
  local cyan = colors.cyan
  local blue = colors.blue
  local grey = colors.grey
  local yellow = colors.yellow
  local pink = colors.pink

  local groups = {
    NormalNC = { fg = fg, bg = bg },
    NormalFloat = { bg = bg },
    FloatBorder = { fg = blue, bg = bg },
    FloatTitle = { fg = grey, bg = bg },

    Pmenu = { fg = fg, bg = bg },
    PmenuBorder = { fg = blue, bg = bg },
    PmenuSel = { fg = fg, bg = bg1 },
    PmenuSbar = { fg = fg, bg = bg },
    PmenuThumb = { bg = blue },
    PmenuMatch = { fg = pink },
    PmenuMatchSel = { fg = pink },

    WinSeparator = { fg = blue, bg = bg, bold = true },
    WinSeparatorNC = { fg = blue, bg = bg, bold = true },

    -- Statusline
    StatusLine = { bg = bg },
    StatusLineNC = { bg = bg },

    -- Blink.cmp
    BlinkCmpLabel = { fg = fg, bg = bg },
    BlinkCmpMenu = { fg = grey, bg = bg },
    BlinkCmpMenuBorder = { fg = blue, bg = bg },
    BlinkCmpDocBorder = { fg = blue, bg = bg },
    BlinkCmpSignatureHelpBorder = { fg = blue, bg = bg },
    BlinkCmpMenuSelection = { fg = blue, bg = bg1, bold = true },
    BlinkCmpLabelMatch = { fg = pink, bg = "NONE" },
    BlinkCmpLabelDeprecated = { fg = grey, bg = "NONE", strikethrough = true },
    BlinkCmpLabelDetail = { fg = pink, bg = "NONE", italic = true },
    BlinkCmpLabelDescription = { fg = pink, bg = "NONE", italic = true },
    BlinkCmpSource = { fg = pink, bg = "NONE", italic = true },

    -- Avante
    AvantePromptInputBorder = { link = "Normal" },
    AvanteConflictCurrent = { fg = bg, bg = blue },
    AvanteConflictIncoming = { fg = bg, bg = green },
    AvanteConflictCurrentLabel = { fg = bg, bg = blue },
    AvanteConflictIncomingLabel = { fg = bg, bg = green },

    -- Mason
    MasonNormal = { fg = fg, bg = bg },

    -- Dashboard
    DashboardHeader = { fg = cyan },
    DashboardFooter = { fg = grey },
    DashboardKey = { fg = grey },

    -- Fzf-lua
    FzfLuaCursorLine = { fg = blue, bg = bg1 },
    FzfLuaFzfMatch = { fg = pink },
  }
  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return M
