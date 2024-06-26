local M = {}

M.keys = { "c", "d", "g", "v", "y", "z", "<Space>", "\\" }

local options = {
  icons = { breadcrumb = "»", separator = "➜", group = "" },
  layout = { height = { min = 2, max = 10 }, align = "center" },
}

local rg = {
  -- Quit
  ["<Space>q"] = { "<CMD>q<CR>", "Quit" },

  -- Window
  ["<Space>w"] = { "<C-w>", "Window+" },

  -- Visual
  ["v"] = { name = "Visual+", ["v"] = { "v", "Visual Mode" }, ["b"] = { "<C-v>", "Visual Block" } },

  -- Debug
  ["<Space>d"] = { name = "Debug+" },

  -- Git
  ["<Space>g"] = { name = "Git+" },

  -- LSP
  ["gd"] = {
    function()
      vim.lsp.buf.definition()
    end,
    "Definition",
  },
  ["K"] = {
    function()
      if vim.inspect(vim.lsp.get_clients { bufnr = 0 }) == "{}" then
        pcall(vim.cmd, "Man")
      else
        vim.lsp.buf.hover()
      end
    end,
    "Hover",
  },
  ["<Space>l"] = {
    name = "LSP+",
    ["r"] = {
      function()
        vim.lsp.buf.references()
      end,
      "References",
    },
    ["e"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostics",
    },
    ["E"] = {
      function()
        vim.diagnostic.setqflist()
      end,
      "Workspace Diagnostics",
    },
    ["a"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "Rename",
    },
    ["c"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code Action",
    },
    ["g"] = {
      function()
        vim.lsp.buf.outgoing_calls()
      end,
      "Outgoing Calls",
    },
  },

  -- Search
  ["<Space>f"] = {
    name = "Find+",
    ["g"] = {
      function()
        local arg = vim.fn.input "Grep: "

        if arg == "" or arg == nil then
          return
        end

        pcall(vim.cmd, "vimgrep /" .. arg .. "/gj **")
        vim.cmd "copen"
      end,
      "Grep",
    },
  },

  -- Color
  ["<Space>p"] = { name = "Preview+" },

  -- Toggle
  ["<Space>t"] = {
    name = "Toggle+",
    ["n"] = { "<CMD>NumberToggle<CR>", "Number" },
    ["r"] = { "<CMD>RelativenumberToggle<CR>", "Relativenumber" },
    ["l"] = { "<CMD>StatuslineToggle<CR>", "Statusline" },
    ["w"] = { "<CMD>WrapToggle<CR>", "Wrap" },
  },
}

function M.config()
  require("which-key").setup(options)
  require("which-key").register(rg)
end

return M
