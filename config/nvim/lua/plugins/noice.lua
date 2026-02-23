local M = { "folke/noice.nvim" }
M.event = "VeryLazy"

M.dependencies = {
  "MunifTanjim/nui.nvim",
  "rcarriga/nvim-notify",
}

M.opts = {
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {},
  },
  messages = { enabled = false },
  popupmenu = {
    enabled = true,
    backend = "nui",
  },
  notify = { enabled = false },
  lsp = {
    progress = { enabled = false },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false,
    },
    hover = { enabled = false },
    signature = { enabled = false },
    message = { enabled = false },
  },
  health = { checker = false },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = false,
    inc_rename = false,
    lsp_doc_border = false,
  },
  views = {
    popupmenu = {
      relative = "editor",
      zindex = 65,
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winblend = 0,
        winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
      },
    },
  },
}

return M
