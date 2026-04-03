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
      { { "n" },      "<Leader>/",     "<CMD>FzfLua blines<CR>",               { desc = "Line" } },
      { { "n" },      "<Leader>:",     "<CMD>FzfLua commands<CR>",             { desc = "Commands" } },
      { { "n" },      "<Leader>f/",    "<CMD>FzfLua search_history<CR>",       { desc = "Search History" } },
      { { "n" },      "<Leader>f:",    "<CMD>FzfLua command_history<CR>",      { desc = "Command History" } },
      { { "n" },      "<Leader>f<CR>", "<CMD>FzfLua<CR>",                      { desc = "Builtin" } },
      { { "n" },      "<Leader>f`",    "<CMD>FzfLua resume<CR>",               { desc = "Resume" } },
      { { "n" },      "<Leader>fb",    "<CMD>FzfLua buffers<CR>",              { desc = "Buffers" } },
      { { "n" },      "<Leader>fd",    "<CMD>FzfLua diagnostics_document<CR>", { desc = "Diagnostics" } },
      { { "n" },      "<Leader>ff",    "<CMD>FzfLua files<CR>",                { desc = "Files" } },
      { { "n" },      "<Leader>fg",    "<CMD>FzfLua live_grep<CR>",            { desc = "Live Grep" } },
      { { "n" },      "<Leader>fh",    "<CMD>FzfLua help_tags<CR>",            { desc = "Help" } },
      { { "n" },      "<Leader>fo",    "<CMD>FzfLua oldfiles<CR>",             { desc = "Oldfile" } },
      { { "n" },      "<Leader>fz",    "<CMD>FzfLua zoxide<CR>",               { desc = "Zoxide" } },
      { { "n" },      "grf",           "<CMD>FzfLua lsp_finder<CR>",           { desc = "Lsp Finder" } },
      { { "n", "v" }, "q/",            "<CMD>FzfLua search_history<CR>",       { desc = "Search History" } },
      { { "n", "v" }, "q:",            "<CMD>FzfLua command_history<CR>",      { desc = "Command History" } },
    }
  end,
}
