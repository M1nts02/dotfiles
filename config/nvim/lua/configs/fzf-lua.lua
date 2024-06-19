local M = {}

local utils = require "modules.utils"

M.keys = {
  { "<Space>f<CR>", "<CMD>FzfLua builtin<CR>", desc = "Builtin" },
  { "<Space>ff", "<CMD>FzfLua files<CR>", desc = "File" },
  { "<Space>fo", "<CMD>FzfLua oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fb", "<CMD>FzfLua buffers<CR>", desc = "Buffers" },
  { "<Space>f<Tab>", "<CMD>FzfLua tabs<CR>", desc = "Tabs" },
  { "<Space>lS", "<CMD>FzfLua lsp_workspace_symbols<CR>", desc = "Symbol Workspace" },
  { "<Space>fh", "<CMD>FzfLua helptags<CR>", desc = "Help" },
  { "<Space>fc", "<CMD>FzfLua commands<CR>", desc = "Commands" },
}

M.opts = {
  winopts = {
    height = 0.7,
    width = 0.8,
    preview = {
      default = function()
        if utils.executable "bat" then
          return "bat"
        end
        return "builtin"
      end,
      horizontal = "right:50%",
      scrollbar = false,
    },
  },
  fzf_colors = {
    ["fg"] = { "fg", "CursorLine" },
    ["bg"] = { "bg", "Normal" },
    ["hl"] = { "fg", "Comment" },
    ["fg+"] = { "fg", "Normal" },
    ["bg+"] = { "bg", "CursorLine" },
    ["hl+"] = { "fg", "Statement" },
    ["info"] = { "fg", "PreProc" },
    ["prompt"] = { "fg", "Directory" },
    ["pointer"] = { "fg", "Exception" },
    ["marker"] = { "fg", "SpecialKey" },
    ["spinner"] = { "fg", "WarningMsg" },
    ["header"] = { "fg", "Comment" },
    ["gutter"] = { "bg", "Normal" },
  },
}

return M
