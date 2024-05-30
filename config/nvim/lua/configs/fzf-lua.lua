local M = {}

local utils = require "modules.utils"
local icons = require "modules.icons"

M.keys = {
  {
    "<Space>f<CR>",
    function()
      require("fzf-lua").builtin { prompt = icons.Search .. " " }
    end,
    desc = "Builtin",
  },
  {
    "<Space>ff",
    function()
      require("fzf-lua").files()
    end,
    desc = "File",
  },
  {
    "<Space>fo",
    function()
      require("fzf-lua").oldfiles()
    end,
    desc = "Oldfile",
  },
  {
    "<Space>fm",
    function()
      require("fzf-lua").marks { prompt = icons.Bookmarks .. " " }
    end,
    desc = "Marks",
  },
  {
    "<Space>fb",
    function()
      require("fzf-lua").buffers()
    end,
    desc = "Buffers",
  },
  {
    "<Space>f<Tab>",
    function()
      require("fzf-lua").tabs()
    end,
    desc = "Tabs",
  },
  {
    "<Space><Tab>",
    function()
      require("fzf-lua").tabs()
    end,
    desc = "Tabs",
  },
  {
    "<Space>lS",
    function()
      require("fzf-lua").lsp_workspace_symbols { prompt = icons.Search .. " " }
    end,
    desc = "Symbol Workspace",
  },
  {
    "<Space>f/",
    function()
      require("fzf-lua").lines()
    end,
    desc = "Buffers line",
  },
  {
    "<Space>/",
    function()
      require("fzf-lua").blines()
    end,
    desc = "Line",
  },
  {
    "<Space>fh",
    function()
      require("fzf-lua").help_tags {
        prompt = "󰋖 ",
        winopts = {
          height = 0.5,
          width = 0.5,
          preview = { hidden = "hidden" },
        },
      }
    end,
    desc = "Help",
  },
  {
    "<A-x>",
    function()
      require("fzf-lua").commands {
        prompt = " ",
        winopts = {
          height = 0.5,
          width = 0.5,
          preview = { hidden = "hidden" },
        },
      }
    end,
    desc = "Commands",
  },
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
  previewers = {
    builtin = {
      treesitter = { enable = false },
      extensions = {
        ["png"] = { "viu", "-b" },
        ["svg"] = { "chafa", "{file}" },
        ["jpg"] = { "viu", "-b" },
      },
    },
  },
  files = { prompt = icons.Search .. " ", cwd_prompt = false },
  git = {
    files = {
      prompt = icons.Search .. " ",
      cmd = "git ls-files --exclude-standard",
      multiprocess = true,
      git_icons = true,
      file_icons = true,
      color_icons = true,
      cwd_header = false,
    },
    status = { prompt = icons.Search .. " " },
    commits = { prompt = icons.Search .. " " },
    bcommits = { prompt = icons.Search .. " " },
    branches = { prompt = icons.Search .. " " },
    tags = { prompt = icons.Search .. " " },
    stash = { prompt = icons.Search .. " " },
  },
  grep = { prompt = icons.WordFile .. " ", input_prompt = icons.Input .. " " },
  args = { prompt = icons.Search .. " " },
  oldfiles = { prompt = icons.DefaultFile .. " ", cwd_only = false },
  buffers = { prompt = icons.Search .. " " },
  tabs = { prompt = icons.Search .. " ", tab_title = "Tab", tab_marker = icons.Bookmarks .. " " },
  lines = { prompt = icons.Search .. " " },
  blines = { prompt = icons.Search .. " " },
  tags = { prompt = icons.Search .. " ", no_header = true, no_header_i = true },
  btags = { prompt = icons.Search .. " " },
  colorschemes = { prompt = icons.Colorscheme .. " ", live_preview = false, winopts = { height = 0.55, width = 0.30 } },
  awesome_colorschemes = { prompt = icons.Colorscheme .. " ", live_preview = false },
  quickfix_stack = { prompt = icons.Search .. " ", marker = icons.Bookmarks .. " " },
  lsp = {
    prompt_postfix = icons.Search .. " ",
    code_actions = { prompt = icons.Search .. " " },
    finder = { prompt = icons.Search .. " " },
  },
  diagnostics = { prompt = icons.Search .. " " },
}

return M
