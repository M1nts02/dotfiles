return {
  "akinsho/toggleterm.nvim",
  keys = {
    [[<C-\>]],
    {
      "<Space>gg",
      function()
        local lazygit =
          require("toggleterm.terminal").Terminal:new { cmd = "lazygit -sm half", hidden = true, direction = "float" }
        lazygit:toggle()
      end,
      desc = "Lazygit",
    },
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
