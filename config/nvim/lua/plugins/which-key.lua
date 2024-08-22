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
    "Window+",
  },

  -- Git
  { "<Space>g", group = "Git+" },

  -- LSP
  { "<Space>l", group = "LSP+" },
  {
    "<Space>k",
    function()
      if vim.inspect(vim.lsp.get_clients { bufnr = 0 }) == "{}" then
        pcall(vim.cmd, "Man")
      else
        vim.lsp.buf.hover()
      end
    end,
    desc = "Hover",
  },
  { "<Space>d", vim.diagnostic.open_float, desc = "Dianostic" },
  { "<Space>la", vim.lsp.buf.rename, desc = "Rename" },
  { "<Space>lc", vim.lsp.buf.code_action, desc = "Code Action" },

  -- Search
  { "<Space>f", group = "Find+" },

  -- Color
  { "<Space>p", group = "Preview+" },

  -- Toggle
  { "<Space>t", group = "Toggle+" },
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
