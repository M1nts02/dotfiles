return {
  "akinsho/toggleterm.nvim",
  keys = {
    [[<C-\>]],
  },
  main = "toggleterm",
  opts = {
    open_mapping = [[<c-\>]],
    size = function(term)
      if term.direction == "horizontal" then
        return math.min(20, vim.o.lines * 0.5)
      elseif term.direction == "vertical" then
        return math.min(40, vim.o.columns * 0.5)
      end
    end,
    direction = "horizontal",
    float_opts = { border = "curved" },
    shade_terminals = false,
  },
}
