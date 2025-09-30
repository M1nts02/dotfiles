return {
  "akinsho/toggleterm.nvim",
  keys = { [[<C-\>]] },
  main = "toggleterm",
  opts = {
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    autochdir = false,
    start_in_insert = true,
    direction = "float",
    close_on_exit = true,
    auto_scroll = true,
    float_opts = { border = "curved" },
    winbar = { enabled = false },
  },
}
