return {
  "lewis6991/hover.nvim",
  event = { "LspAttach" },
  keys = {
    {
      "K",
      function()
        require("hover").hover()
      end,
      desc = "Hover",
    },
    {
      "<Space>k",
      function()
        require("hover").hover()
      end,
      desc = "Hover",
    },
    {
      "gk",
      function()
        require("hover").hover_select()
      end,
      desc = "Hover (select)",
    },
  },
  config = function()
    require("hover").setup {
      init = function()
        require "hover.providers.lsp"
        require "hover.providers.dap"
        require "hover.providers.fold_preview"
        require "hover.providers.diagnostic"
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
      mouse_delay = 0,
    }
  end,
}
