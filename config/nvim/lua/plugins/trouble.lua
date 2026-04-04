return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup { focus = true, modes = { symbols = { focus = true } } }
    Utils.setmap {
      { { "n" }, "<Space>fq", function() require("trouble").toggle("qflist") end,             { desc = "Quickfix" } },
      { { "n" }, "gro",       function() require("trouble").toggle("symbols") end,            { desc = "Symbols" } },
      { { "n" }, "gd",        function() require("trouble").open("lsp_definitions") end,      { desc = "Definition" } },
      { { "n" }, "grd",       function() require("trouble").toggle("diagnostics") end,        { desc = "Diagnostics" } },
      { { "n" }, "gri",       function() require("trouble").open("lsp_implementations") end,  { desc = "Implementations" } },
      { { "n" }, "grO",       function() require("trouble").toggle("lsp_outgoing_calls") end, { desc = "Outgoing Calls" } },
      { { "n" }, "grr",       function() require("trouble").toggle("lsp_references") end,     { desc = "References" } },
      { { "n" }, "grt",       function() require("trouble").open("lsp_type_definitions") end, { desc = "Type Definition" } },
    }
  end,
}
