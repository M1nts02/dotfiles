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
      { "n",  "<Leader>/",     fzf_lua.blines,               { desc = "Line" } },
      { "n",  "<Leader>f<CR>", fzf_lua.builtin,              { desc = "Builtin" } },
      { "n",  "<Leader>f`",    fzf_lua.resume,               { desc = "Resume" } },
      { "n",  "<Leader>fb",    fzf_lua.buffers,              { desc = "Buffers" } },
      { "n",  "<Leader>fc",    fzf_lua.commands,             { desc = "Commands" } },
      { "n",  "<Leader>fd",    fzf_lua.diagnostics_document, { desc = "Diagnostics" } },
      { "n",  "<Leader>ff",    fzf_lua.files,                { desc = "Files" } },
      { "n",  "<Leader>fg",    fzf_lua.live_grep,            { desc = "Live Grep" } },
      { "n",  "<Leader>fh",    fzf_lua.help_tags,            { desc = "Help" } },
      { "n",  "<Leader>fo",    fzf_lua.oldfiles,             { desc = "Oldfile" } },
      { "n",  "<Leader>fz",    fzf_lua.zoxide,               { desc = "Zoxide" } },
      { "n",  "<Leader>gc",    fzf_lua.git_commits,          { desc = "Git Commits" } },
      { "n",  "<Leader>gs",    fzf_lua.git_status,           { desc = "Git Status" } },
      { "n",  "<Leader>gb",    fzf_lua.git_branches,         { desc = "Git Branches" } },
      { "n",  "grf",           fzf_lua.lsp_finder,           { desc = "Lsp Finder" } },
      { "nv", "q/",            fzf_lua.search_history,       { desc = "Search History" } },
      { "nv", "q:",            fzf_lua.command_history,      { desc = "Command History" } },
    }
  end,
}
