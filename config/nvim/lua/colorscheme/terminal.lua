local M = {}

M.set_terminal_hl = function(palette)
  vim.g.terminal_color_0 = palette.bg
  vim.g.terminal_color_8 = palette.bg2

  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_9 = palette.red

  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_10 = palette.green

  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_11 = palette.yellow

  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_12 = palette.blue

  vim.g.terminal_color_5 = palette.pink
  vim.g.terminal_color_13 = palette.pink

  vim.g.terminal_color_6 = palette.blue
  vim.g.terminal_color_14 = palette.blue

  vim.g.terminal_color_7 = palette.fg
  vim.g.terminal_color_15 = palette.fg

  vim.g.terminal_color_background = palette.bg
  vim.g.terminal_color_foreground = palette.fg
end

return M
