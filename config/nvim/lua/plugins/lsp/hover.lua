local M = {}

M.keys = {
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
}

function M.config()
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
end

return M
