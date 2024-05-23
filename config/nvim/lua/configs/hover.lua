local M = {}

local opts = {
  init = function()
    require "hover.providers.lsp"
    require "hover.providers.man"
    require "hover.providers.dictionary"
  end,
  preview_opts = {
    border = "rounded",
  },
  preview_window = false,
  title = true,
  mouse_providers = {
    "LSP",
  },
  mouse_delay = 1000,
}

M.keys = {
  {
    "K",
    function()
      require("hover").hover()
    end,
    { desc = "hover.nvim" },
  },
  {
    "gK",

    function()
      require("hover").hover_select()
    end,
    { desc = "hover.nvim (select)" },
  },
  {
    "<MouseMove>",
    function()
      require("hover").hover_mouse()
    end,
    { desc = "hover.nvim (mouse)" },
  },
}

M.config = function()
  require("hover").setup(opts)
  vim.o.mousemoveevent = true
end

return M
