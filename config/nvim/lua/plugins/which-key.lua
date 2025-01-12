local opts = {
  notify = false,
  icons = {
    rules = false,
    breadcrumb = "»",
    separator = "➜",
    group = "",
  },
  layout = {
    height = { min = 2, max = 10 },
    align = "center",
  },
}

local rg = {
  -- Quit
  { "<Space>q", "<CMD>q<CR>", desc = "Quit" },

  -- Window
  {
    "<Space>w",
    function()
      require("which-key").show {
        keys = "<c-w>",
        loop = true,
      }
    end,
    desc = "Window+",
  },

  -- Git
  { "<Space>g", group = "Git+" },

  -- LSP
  { "<Space>l", group = "LSP+" },
  { "<Space>lr", vim.lsp.buf.rename, desc = "Rename" },
  { "<Space>la", vim.lsp.buf.code_action, desc = "Code Action" },

  -- Search
  { "<Space>f", group = "Find+" },

  -- Preview
  { "<Space>p", group = "Preview+" },
}

return {
  "folke/which-key.nvim",
  version = "*",
  event = { "VeryLazy" },
  config = function()
    require("which-key").setup(opts)
    require("which-key").add(rg)
  end,
}
