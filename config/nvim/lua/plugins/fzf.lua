local M = { "ibhagwan/fzf-lua", enabled = Utils.executable { "fzf" } }

M.cmd = "FzfLua"

M.dependencies = { "echasnovski/mini.nvim" }

M.keys = {
  { "<Space>f<CR>", "<CMD>FzfLua<CR>", desc = "Builtin" },
  { "<Space>ff", "<CMD>FzfLua files<CR>", desc = "Files" },
  { "<Space>fo", "<CMD>FzfLua oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fc", "<CMD>FzfLua commands winopts.preview.hidden=true<CR>", desc = "Commands" },
  { "<Space>fh", "<CMD>FzfLua help_tags<CR>", desc = "Help" },
  { "<Space>fz", "<CMD>FzfLua zoxide winopts.preview.hidden=true<CR>", desc = "Zoxide" },
  { "<Space>fg", "<CMD>FzfLua live_grep<CR>", desc = "Live Grep" },
  { "<Space>/", "<CMD>FzfLua blines winopts.preview.hidden=true<CR>", desc = "Line" },
  { "<Space>f`", "<CMD>FzfLua resume<CR>", desc = "Resume" },
  { "q:", "<CMD>FzfLua command_history<CR>", desc = "Command History", mode = { "n", "v" } },
  { "q/", "<CMD>FzfLua search_history<CR>", desc = "Search History", mode = { "n", "v" } },
}

M.config = function()
  local fzf_lua = require "fzf-lua"
  fzf_lua.setup {
    fzf_colors = true,
    winopts = {
      preview = { scrollbar = "border" },
      backdrop = 100,
    },
    files = { cwd_prompt = false },
  }
  fzf_lua.register_ui_select()
end

return M
