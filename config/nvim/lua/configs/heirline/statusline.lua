local utils = require "heirline.utils"

local icons = {
  VimIcon = "",
  ScrollText = "",
  GitBranch = "",
  GitAdd = "",
  GitChange = "",
  GitDelete = "",
}

local separators = {
  left = { "", "" },
  right = { "", "" },
  tab = { "", "" },
}

local mode_names = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL (no)",
  ["nov"] = "NORMAL (nov)",
  ["noV"] = "NORMAL (noV)",
  ["no\22"] = "NORMAL",
  ["niI"] = "NORMAL i",
  ["niR"] = "NORMAL r",
  ["niV"] = "NORMAL v",
  ["nt"] = "NTERMINAL",
  ["ntT"] = "NTERMINAL (ntT)",

  ["v"] = "VISUAL",
  ["vs"] = "V-CHAR (Ctrl O)",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  ["\22"] = "V-BLOCK",

  ["i"] = "INSERT",
  ["ic"] = "INSERT (completion)",
  ["ix"] = "INSERT completion",

  ["t"] = "TERMINAL",

  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE (Rc)",
  ["Rx"] = "REPLACEa (Rx)",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE (Rvc)",
  ["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },

  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  ["\19"] = "S-BLOCK",
  ["c"] = "COMMAND",
  ["cv"] = "COMMAND",
  ["ce"] = "COMMAND",
  ["r"] = "PROMPT",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["x"] = "CONFIRM",
  ["!"] = "SHELL",
}
local mode_colors = {
  n = "blue",
  i = "green",
  v = "pink",
  V = "pink",
  ["\22"] = "pink",
  c = "purple",
  s = "orange",
  S = "orange",
  ["\19"] = "orange",
  R = "orange",
  r = "orange",
  ["!"] = "indian_red",
  t = "purple",
}

local get_mode_color = function()
  local mode = vim.fn.mode(1):sub(1, 1)
  return mode_colors[mode]
end

return {
  hl = { fg = "fg", bg = "bg1" },

  -- Mode
  {
    provider = function()
      local mode = vim.fn.mode(1)
      local mode_name = mode_names[mode]
      return " " .. icons.VimIcon .. " " .. mode_name .. " "
    end,
    hl = function()
      return { fg = "bg", bg = get_mode_color(), bold = true }
    end,
  },

  {
    provider = function()
      return separators.left[2]
    end,
    hl = function()
      return { fg = get_mode_color(), bg = "fg2" }
    end,
  },

  -- Filename
  utils.surround(separators.left, "bg2", {
    {
      provider = function()
        return separators.left[2]
      end,
      hl = function()
        return { fg = "fg2", bg = "bg2" }
      end,
    },
    {
      init = function(self)
        local filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
          require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
      end,
      provider = function(self)
        return self.icon and (" " .. self.icon .. " ")
      end,
      hl = function()
        return { fg = "blue", bg = "bg2" }
      end,
    },
    {
      provider = function(self)
        local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local path = vim.api.nvim_buf_get_name(stbufnr)
        local filename = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"

        return filename .. " "
      end,
      hl = function()
        return { fg = "fg", bg = "bg2" }
      end,
    },
  }),

  -- Git
  utils.surround(separators.left, "bg1", {
    {
      init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
      end,
      condition = require("heirline.conditions").is_git_repo,
      hl = { fg = "fg1", bg = "bg1" },

      { -- git branch name
        provider = function(self)
          return "  " .. self.status_dict.head
        end,
        hl = { bold = true },
        on_click = {
          callback = function()
            pcall(vim.cmd, "Neogit")
          end,
          name = "heirline_git",
          update = true,
        },
      },
      {
        condition = function(self)
          return self.has_changes
        end,
        provider = "  ",
      },
      {
        provider = function(self)
          local count = self.status_dict.added or 0
          return count > 0 and (icons.GitAdd .. " " .. count .. " ")
        end,
        hl = { fg = "green" },
      },
      {
        provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and (icons.GitDelete .. " " .. count .. " ")
        end,
        hl = { fg = "red" },
      },
      {
        provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and (icons.GitChange .. " " .. count .. " ")
        end,
        hl = { fg = "blue" },
      },
    },
  }),

  { provider = "%=", hl = { fg = "fg1", bg = "bg1" } },

  -- Lsp message
  {
    provider = function()
      return require("lsp-progress").progress()
    end,
    hl = { fg = "green", bg = "bg1" },
    update = {
      "User",
      pattern = "LspProgressStatusUpdated",
      callback = vim.schedule_wrap(function()
        vim.cmd "redrawstatus"
      end),
    },
  },

  { provider = "%=", hl = { fg = "fg1", bg = "bg1" } },

  {
    condition = require("heirline.conditions").has_diagnostics,
    static = {
      error_icon = " ",
      warn_icon = " ",
      info_icon = "󰋼 ",
      hint_icon = "󰛩 ",
    },

    init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },

    on_click = {
      callback = function()
        vim.diagnostic.setloclist()
      end,
      name = "heirline_diagnostic",
      update = true,
    },

    {
      provider = " ",
    },
    {
      provider = function(self)
        return self.errors > 0 and (self.error_icon .. self.errors .. " ")
      end,
      hl = { fg = "red" },
    },
    {
      provider = function(self)
        return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
      end,
      hl = { fg = "orange" },
    },
    {
      provider = function(self)
        return self.info > 0 and (self.info_icon .. self.info .. " ")
      end,
      hl = { fg = "blue" },
    },
    {
      provider = function(self)
        return self.hints > 0 and (self.hint_icon .. self.hints)
      end,
      hl = { fg = "fg1" },
    },
    {
      provider = " ",
    },
  },

  {
    condition = require("heirline.conditions").lsp_attached,
    update = { "LspAttach", "LspDetach" },
    provider = function()
      local names = {}
      for _, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
        table.insert(names, server.name)
      end
      return " " .. table.concat(names, " ") .. " "
    end,
    hl = { fg = "green" },
  },

  -- WorkDir
  {
    provider = function()
      return ""
    end,
    hl = { fg = "indian_red", bg = "bg1" },
  },
  {
    provider = function()
      return "󰉋 "
    end,
    hl = { fg = "bg", bg = "indian_red" },
  },
  {
    provider = function()
      local name = vim.loop.cwd()
      name = name:match "([^/\\]+)[/\\]*$" or name
      return " " .. name .. " "
    end,
    hl = { fg = "fg" },
    on_click = {
      callback = function()
        vim.cmd "NvimTreeToggle"
      end,
      name = "heirline_nvimtree",
      update = true,
    },
  },

  -- Ruler
  {
    provider = function()
      return separators.right[1]
    end,
    hl = function()
      return { fg = "green", bg = "bg1" }
    end,
  },
  {
    provider = icons.ScrollText .. " ",
    hl = function()
      return { fg = "bg", bg = "green" }
    end,
  },
  {
    provider = " %l:%c %P",
    hl = function()
      return { fg = "green", bg = "bg1" }
    end,
  },
}
