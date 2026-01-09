local M = {
  "nvim-mini/mini.nvim",
  version = "*",
}

M.dependencies = { "nanotee/zoxide.vim" }

M.cmd = { "Pick", "Zi" }

M.keys = {
  { "<Space>f<CR>", "<CMD>Pick resume<CR>", desc = "Resume" },
  { "<Space>fb", "<CMD>Pick buffers<CR>", desc = "Buffers" },
  { "<Space>fc", "<CMD>Pick commands<CR>", desc = "commands" },
  { "<Space>ff", "<CMD>Pick files<CR>", desc = "Files" },
  { "<Space>fg", "<CMD>Pick grep_live<CR>", desc = "Grep Live" },
  { "<Space>fh", "<CMD>Pick help<CR>", desc = "Help" },
  { "<Space>fo", "<CMD>Pick oldfiles<CR>", desc = "Oldfile" },
  { "<Space>fz", "<CMD>Zi<CR>", desc = "Zoxide" },
  { "z=", "<CMD>Pick spellsuggest<CR>", desc = "Spell Suggest" },
}

function M.config()
  require("mini.pairs").setup()
  require("mini.comment").setup()

  local hipatterns = require "mini.hipatterns"
  hipatterns.setup {
    highlighters = {
      -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

      -- Highlight hex color strings (`#rrggbb`) using that color
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  }

  require("mini.diff").setup { view = { style = "sign" } }

  require("mini.extra").setup()
  local MiniPick = require "mini.pick"
  MiniPick.setup {
    mappings = {
      scroll_down = "<C-d>",
      scroll_up = "<C-u>",
    },
  }
  vim.ui.select = function(items, opts, on_choice)
    local start_opts = { window = { config = { width = vim.o.columns } } }
    return MiniPick.ui_select(items, opts, on_choice, start_opts)
  end
end

return M
