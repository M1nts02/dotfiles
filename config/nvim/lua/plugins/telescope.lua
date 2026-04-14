return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
    "benfowler/telescope-luasnip.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      enabled = Utils.executable "make",
      build = function(plugin)
        vim.cmd("!(cd " .. plugin.path .. " && make)")
      end,
    },
  },
  config = function()
    local telescope = require "telescope"
    local themes = require "telescope.themes"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = themes.get_ivy {
        preview = { hide_on_startup = false },
        winblend = 0,
      },
      pickers = {
        commands = { previewer = false },
        current_buffer_fuzzy_find = { previewer = false },
        buffers = {
          previewer = false,
          mappings = {
            i = { ["<C-d>"] = actions.delete_buffer },
            n = { ["x"] = actions.delete_buffer },
          },
        },
        oldfiles = { previewer = false },
      },
      extensions = {
        ["ui-select"] = { themes.get_ivy() },
        luasnip = {
          search = function(entry)
            return entry.context.name .. " " .. entry.context.trigger
          end,
        },
      },
    }

    telescope.load_extension "ui-select"
    telescope.load_extension "luasnip"

    local builtin = require "telescope.builtin"
    local extensions = telescope.extensions

    Utils.setmap {
      { { "n" }, "<Leader>/", builtin.current_buffer_fuzzy_find, { desc = "Lines" } },
      { { "n" }, "<Leader>f<CR>", builtin.builtin, { desc = "Builtin" } },
      { { "n" }, "<Leader>fc", builtin.commands, { desc = "Commands" } },
      { { "n" }, "<Leader>f`", builtin.resume, { desc = "Resume" } },
      { { "n" }, "<Leader>fb", builtin.buffers, { desc = "Buffers" } },
      { { "n" }, "<Leader>fd", builtin.diagnostics, { desc = "Diagnostics" } },
      { { "n" }, "<Leader>ff", builtin.fd, { desc = "Files" } },
      { { "n" }, "<Leader>fg", builtin.live_grep, { desc = "Live Grep" } },
      { { "n" }, "<Leader>fh", builtin.help_tags, { desc = "Help" } },
      { { "n" }, "<Leader>fo", builtin.oldfiles, { desc = "Oldfile" } },
      { { "n" }, "<Leader>fs", extensions.luasnip.luasnip, { desc = "Snippets" } },
      { { "i" }, "<C-l>", extensions.luasnip.luasnip, { desc = "Snippets" } },
      { { "n", "v" }, "q/", builtin.search_history, { desc = "Search History" } },
      { { "n", "v" }, "q:", builtin.command_history, { desc = "Command History" } },
      { { "n" }, "z=", builtin.spell_suggest, { desc = "Spell Suggest" } },
    }
  end,
}
