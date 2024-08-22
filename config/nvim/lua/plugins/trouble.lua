return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    { "<Space>lE", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
    { "<Space>le", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics" },
    { "<Space>ls", "<CMD>Trouble symbols toggle<CR>", desc = "Symbols" },
    { "<Space>lS", "<CMD>Trouble lsp_document_symbols toggle<CR>", desc = "Symbol Workspace" },
    { "gd", "<CMD>Trouble lsp_definitions toggle<CR>", desc = "Definition" },
    { "<Space>lr", "<CMD>Trouble lsp_references toggle<CR>", desc = "References" },
    { "<Space>lg", "<CMD>Trouble lsp_outgoing_calls toggle<CR>", desc = "Outgoing Calls" },
    {
      "<Space>fg",
      function()
        local arg = vim.fn.input "Grep: "

        if arg == "" or arg == nil then
          return
        end

        pcall(vim.cmd, "vimgrep /" .. arg .. "/gj **")
        vim.cmd "Trouble quickfix open"
      end,
      desc = "Grep",
    },
    {
      "<Space>fG",
      function()
        local arg = vim.fn.input "Grep: "

        if arg == "" or arg == nil then
          return
        end

        vim.opt.ignorecase = false
        pcall(vim.cmd, "vimgrep /" .. arg .. "/gj **")
        vim.opt.ignorecase = true
        vim.cmd "Trouble quickfix open"
      end,
      desc = "Grep (Case Sensitive)",
    },
  },
  opts = {},
}
