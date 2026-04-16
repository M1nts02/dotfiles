return {
  "ibhagwan/fzf-lua",
  enabled = Utils.executable "fzf",
  dependencies = { "nvim-mini/mini.nvim" },
  config = function()
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

    Utils.setmap {
      { "n",  "<Leader>/",     FzfLua.blines,               { desc = "Line" } },
      { "n",  "<Leader>f<CR>", FzfLua.builtin,              { desc = "Builtin" } },
      { "n",  "<Leader>f`",    FzfLua.resume,               { desc = "Resume" } },
      { "n",  "<Leader>fb",    FzfLua.buffers,              { desc = "Buffers" } },
      { "n",  "<Leader>fc",    FzfLua.commands,             { desc = "Commands" } },
      { "n",  "<Leader>fd",    FzfLua.diagnostics_document, { desc = "Diagnostics" } },
      { "n",  "<Leader>ff",    FzfLua.files,                { desc = "Files" } },
      { "n",  "<Leader>fg",    FzfLua.live_grep,            { desc = "Live Grep" } },
      { "n",  "<Leader>fh",    FzfLua.help_tags,            { desc = "Help" } },
      { "n",  "<Leader>fo",    FzfLua.oldfiles,             { desc = "Oldfile" } },
      { "n",  "<Leader>fz",    FzfLua.zoxide,               { desc = "Zoxide" } },
      { "n",  "grf",           FzfLua.lsp_finder,           { desc = "Lsp Finder" } },
      { "nv", "q/",            FzfLua.search_history,       { desc = "Search History" } },
      { "nv", "q:",            FzfLua.command_history,      { desc = "Command History" } },
    }
  end,
}
