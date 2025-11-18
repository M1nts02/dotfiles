return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      notify = false,
      icons = {
        rules = false,
        breadcrumb = "»",
        separator = "➜",
        group = "",
      },
      win = {
        border = "rounded",
        title_pos = "left",
      },
    }

    require("which-key").add {
      -- Quit
      { "<Space>q", "<CMD>q<CR>", desc = "Quit" },

      -- Visual
      { "gb", "<C-v>", desc = "Visual Block" },
      { "gl", "V", desc = "Visual Line" },

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
      { "gr", group = "LSP+" },
      { "grn", vim.lsp.buf.rename, desc = "Rename" },
      { "gra", vim.lsp.buf.code_action, desc = "Code Action" },

      -- Search
      { "<Space>f", group = "Find+" },
    }
  end,
}
