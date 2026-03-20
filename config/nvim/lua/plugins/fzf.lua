local M = { "ibhagwan/fzf-lua" }

M.enabled = Utils.executable { "fzf" }
M.event = "VeryLazy"
M.cmd = "FzfLua"

M.dependencies = { "echasnovski/mini.nvim" }

M.keys = {
  { "<Leader>/", "<CMD>FzfLua blines<CR>", desc = "Line" },
  { "<Leader>:", "<CMD>FzfLua commands<CR>", desc = "Commands" },
  { "<Leader>f/", "<CMD>FzfLua search_history<CR>", desc = "Search History" },
  { "<Leader>f:", "<CMD>FzfLua command_history<CR>", desc = "Command History" },
  { "<Leader>f<CR>", "<CMD>FzfLua<CR>", desc = "Builtin" },
  { "<Leader>f`", "<CMD>FzfLua resume<CR>", desc = "Resume" },
  { "<Leader>fb", "<CMD>FzfLua buffers<CR>", desc = "Buffers" },
  { "<Leader>ff", "<CMD>FzfLua files<CR>", desc = "Files" },
  { "<Leader>fg", "<CMD>FzfLua live_grep<CR>", desc = "Live Grep" },
  { "<Leader>fh", "<CMD>FzfLua help_tags<CR>", desc = "Help" },
  { "<Leader>fo", "<CMD>FzfLua oldfiles<CR>", desc = "Oldfile" },
  { "<Leader>fq", "<CMD>FzfLua quickfix<CR>", desc = "Quickfix" },
  { "<Leader>fz", "<CMD>FzfLua zoxide<CR>", desc = "Zoxide" },
  { "gd", "<CMD>FzfLua lsp_definitions<CR>", desc = "Definition" },
  { "grO", "<CMD>FzfLua lsp_outgoing_calls toggle<CR>", desc = "Outgoing Calls" },
  { "grd", "<CMD>FzfLua diagnostics_document<CR>", desc = "Diagnostics" },
  { "grf", "<CMD>FzfLua lsp_finder<CR>", desc = "Lsp Finder" },
  { "gri", "<CMD>FzfLua fsp_implementations<CR>", desc = "Implementations" },
  { "gro", "<CMD>FzfLua lsp_document_symbols<CR>", desc = "Symbols" },
  { "grr", "<CMD>FzfLua lsp_references toggle<CR>", desc = "References" },
  { "grt", "<CMD>FzfLua lsp_typedefs<CR>", desc = "Type Definition" },
  { "q/", "<CMD>FzfLua search_history<CR>", desc = "Search History", mode = { "n", "v" } },
  { "q:", "<CMD>FzfLua command_history<CR>", desc = "Command History", mode = { "n", "v" } },
}

M.config = function()
  local fzf_lua = require "fzf-lua"
  fzf_lua.setup {
    "ivy",
    fzf_colors = true,
    winopts = {
      preview = { scrollbar = "none" },
      backdrop = 100,
    },
    files = { cwd_prompt = false },
    commands = { winopts = { preview = { hidden = true } } },
    zoxide = { winopts = { preview = { hidden = true } } },
  }
  fzf_lua.register_ui_select()
end

return M
