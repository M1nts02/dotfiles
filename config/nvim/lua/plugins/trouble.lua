return {
  "folke/trouble.nvim",
  config = function()
    local trouble = require("trouble")
    trouble.setup { focus = true, modes = { symbols = { focus = true } } }
    Utils.setmap {
      { "n", "<Leader>fq", function() trouble.toggle("qflist") end,             { desc = "Quickfix" } },
      { "n", "gro",        function() trouble.toggle("symbols") end,            { desc = "Symbols" } },
      { "n", "gd",         function() trouble.open("lsp_definitions") end,      { desc = "Definition" } },
      { "n", "grd",        function() trouble.toggle("diagnostics") end,        { desc = "Diagnostics" } },
      { "n", "gri",        function() trouble.open("lsp_implementations") end,  { desc = "Implementations" } },
      { "n", "grO",        function() trouble.toggle("lsp_outgoing_calls") end, { desc = "Outgoing Calls" } },
      { "n", "grr",        function() trouble.toggle("lsp_references") end,     { desc = "References" } },
      { "n", "grt",        function() trouble.open("lsp_type_definitions") end, { desc = "Type Definition" } },
    }
  end,
}
