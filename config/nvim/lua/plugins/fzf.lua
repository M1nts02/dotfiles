local utils = require "modules.utils"

return {
  "ibhagwan/fzf-lua",
  enabled = utils.executable { "fzf" },
  event = { "VeryLazy" },
  keys = {
    { "<Space>f<CR>", "<CMD>FzfLua<CR>", desc = "Builtin" },
    { "<Space>ff", "<CMD>FzfLua files<CR>", desc = "Files" },
    { "<Space>fo", "<CMD>FzfLua oldfiles<CR>", desc = "Oldfile" },
    { "<Space>fb", "<CMD>FzfLua buffers<CR>", desc = "Buffers" },
    { "<Space>fc", "<CMD>FzfLua commands<CR>", desc = "Commands" },
    { "<Space>fh", "<CMD>FzfLua help_tags<CR>", desc = "Help" },
    { "<Space>fz", "<CMD>FzfLua zoxide<CR>", desc = "Zoxide" },
    { "`", "<CMD>FzfLua marks<CR>", desc = "Marks" },
    { "'", "<CMD>FzfLua marks<CR>", desc = "Marks" },
    { '"', "<CMD>FzfLua registers<CR>", desc = "Registers" },
    { "<C-r>", "<CMD>FzfLua registers<CR>", desc = "Registers", mode = "i" },
    { "z=", "<CMD>FzfLua spell_suggest<CR>", desc = "Spell_suggest" },
  },
  config = function()
    local fzf_lua = require "fzf-lua"
    fzf_lua.setup {
      fzf_colors = true,
      winopts = { split = "belowright new", preview = { hidden = true, scrollbar = "border" } },
      fzf_opts = {
        ["--no-hscroll"] = true,
        ["--input-border"] = "none",
        ["--style"] = "minimal",
        ["--layout"] = "default",
        ["--border"] = "none",
        ["--highlight-line"] = true,
      },
      keymap = {
        builtin = { ["ctrl-s"] = "toggle-preview" },
        fzf = { ["ctrl-s"] = "toggle-preview" },
      },
      files = { cwd_prompt = false },
    }
    fzf_lua.register_ui_select()
  end,
  dependencies = { "echasnovski/mini.nvim" },
}
