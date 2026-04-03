return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup {
      focus = true,
      modes = {
        symbols = {
          focus = true,
        },
      },
    }

    Utils.setmap {
      { { "n" }, "<Space>fq", "<CMD>Trouble qflist toggle<CR>",             { desc = "Quickfix" } },
      { { "n" }, "gro",       "<CMD>Trouble symbols toggle<CR>",            { desc = "Symbols" } },
      { { "n" }, "gd",        "<CMD>Trouble lsp_definitions<CR>",           { desc = "Definition" } },
      { { "n" }, "grd",       "<CMD>Trouble diagnostics toggle<CR>",        { desc = "Diagnostics" } },
      { { "n" }, "gri",       "<CMD>Trouble lsp_implementations<CR>",       { desc = "Implementations" } },
      { { "n" }, "grO",       "<CMD>Trouble lsp_outgoing_calls toggle<CR>", { desc = "Outgoing Calls" } },
      { { "n" }, "grr",       "<CMD>Trouble lsp_references toggle<CR>",     { desc = "References" } },
      { { "n" }, "grt",       "<CMD>Trouble lsp_type_definitions<CR>",      { desc = "Type Definition" } },
    }
  end,
}
