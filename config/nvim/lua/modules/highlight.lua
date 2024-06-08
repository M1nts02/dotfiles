local M = {}

function M.get_palette()
  local get_hl = require("modules.utils").get_hl

  local palette = {}
  palette.bg = get_hl("Normal").bg
  palette.bg1 = get_hl("Pmenu").bg
  palette.bg2 = get_hl("PmenuSel").bg
  palette.fg = get_hl("Normal").fg
  palette.fg1 = get_hl("Comment").fg
  palette.fg2 = get_hl("TabLine").fg
  palette.cyan = get_hl("Character").fg
  palette.blue = get_hl("Function").fg
  palette.green = get_hl("String").fg
  palette.orange = get_hl("Constant").fg
  palette.yellow = get_hl("Structure").fg
  palette.purple = get_hl("Keyword").fg
  palette.indian_red = get_hl("Identifier").fg
  palette.red = get_hl("Error").fg
  palette.pink = get_hl("SpecialComment").fg
  return palette
end

function M.set_groups(palette)
  local groups = {
    NormalFloat = { bg = palette.bg },

    -- Gitsigns.
    GitSignsAddLn = { fg = palette.green },
    GitSignsDeleteLn = { fg = palette.yellow },
    GitSignsChange = { fg = palette.indian_red },

    -- Cmp.
    CmpItemAbbrDeprecated = { fg = palette.fg1, bg = "NONE", strikethrough = true },
    CmpItemAbbrMatch = { fg = palette.blue, bg = "NONE", bold = true },
    CmpItemAbbrMatchFuzzy = { fg = palette.blue, bg = "NONE", bold = true },
    CmpItemMenu = { fg = palette.purple, bg = "NONE", italic = true },

    CmpItemKindField = { fg = palette.bg1, bg = palette.indian_red },
    CmpItemKindProperty = { fg = palette.bg1, bg = palette.indian_red },
    CmpItemKindEvent = { fg = palette.bg1, bg = palette.indian_red },

    CmpItemKindText = { fg = palette.bg1, bg = palette.green },
    CmpItemKindEnum = { fg = palette.bg1, bg = palette.green },
    CmpItemKindKeyword = { fg = palette.bg1, bg = palette.green },

    CmpItemKindConstant = { fg = palette.bg1, bg = palette.orange },
    CmpItemKindConstructor = { fg = palette.bg1, bg = palette.orange },
    CmpItemKindReference = { fg = palette.bg1, bg = palette.orange },

    CmpItemKindFunction = { fg = palette.bg1, bg = palette.purple },
    CmpItemKindStruct = { fg = palette.bg1, bg = palette.purple },
    CmpItemKindClass = { fg = palette.bg1, bg = palette.purple },
    CmpItemKindModule = { fg = palette.bg1, bg = palette.purple },
    CmpItemKindOperator = { fg = palette.bg1, bg = palette.purple },

    CmpItemKindVariable = { fg = palette.bg1, bg = palette.fg },
    CmpItemKindFile = { fg = palette.bg1, bg = palette.fg },

    CmpItemKindUnit = { fg = palette.bg1, bg = palette.yellow },
    CmpItemKindSnippet = { fg = palette.bg1, bg = palette.yellow },
    CmpItemKindFolder = { fg = palette.bg1, bg = palette.yellow },

    CmpItemKindMethod = { fg = palette.bg1, bg = palette.blue },
    CmpItemKindValue = { fg = palette.bg1, bg = palette.blue },
    CmpItemKindEnumMember = { fg = palette.bg1, bg = palette.blue },

    CmpItemKindInterface = { fg = palette.bg1, bg = palette.cyan },
    CmpItemKindColor = { fg = palette.bg1, bg = palette.cyan },
    CmpItemKindTypeParameter = { fg = palette.bg1, bg = palette.cyan },

    -- Word under cursor.
    CursorWord = { bg = palette.blue },
    CursorWord0 = { bg = palette.blue },
    CursorWord1 = { bg = palette.blue },

    -- WhichKey.
    WhichKeyFloat = { fg = palette.fg, bg = palette.bg },
    WhichKeyBorder = { bg = palette.bg },

    -- Neogit.
    NeogitChangeDeleted = { fg = palette.fg1, bg = palette.bg },
    NeogitDiffContextHighlight = { bg = palette.bg1 },
    NeogitHunkHeader = { fg = palette.pink },
    NeogitHunkHeaderHighlight = { fg = palette.pink, bg = palette.bg1 },
    NeogitDiffAddHighlight = { fg = palette.bg1, bg = palette.green },
    NeogitDiffDeleteHighlight = { fg = palette.bg1, bg = palette.indian_red },
    NeogitDiffAdd = { fg = palette.green, bg = palette.bg },
    NeogitDiffDelete = { fg = palette.indian_red, bg = palette.bg },
    NeogitDiffContext = { fg = palette.fg1, bg = palette.bg },
    NeogitDiffHeader = { fg = palette.fg1, bg = palette.bg },

    -- NvimTree.
    NvimTreeSignColumn = { fg = palette.fg, bg = palette.bg },
    NvimTreeNormalFloat = { fg = palette.fg, bg = palette.bg },

    -- Dap.
    NvimDapVirtualText = { fg = palette.fg1 },

    -- DAP UI.
    DapUIScope = { fg = palette.green },
    DapUIType = { fg = palette.cyan },
    DapUIDecoration = { fg = palette.blue },
    DapUIThread = { fg = palette.green },
    DapUIStoppedThread = { fg = palette.orange },
    DapUISource = { fg = palette.green },
    DapUILineNumber = { fg = palette.fg1 },
    DapUIFloatBorder = { fg = palette.fg1 },
    DapUIWatchesEmpty = { fg = palette.orange },
    DapUIWatchesValue = { fg = palette.green },
    DapUIWatchesError = { fg = palette.red },
    DapUIBreakpointsPath = { fg = palette.green },
    DapUIBreakpointsInfo = { fg = palette.fg1 },
    DapUIBreakpointsCurrentLine = { fg = palette.fg1, bg = palette.bg1, bold = true },

    -- Dashboard-nvim.
    DashboardHeader = { fg = palette.cyan },
    DashboardFooter = { fg = palette.fg1 },

    -- Fzf-lua
    FzfLuaHeaderBind = { fg = palette.fg1, bg = palette.bg },
    FzfLuaHeaderText = { fg = palette.fg1, bg = palette.bg },
    FzfLuaBufNr = { fg = palette.indian_red, bg = palette.bg },
    FzfLuaBufLineNr = { fg = palette.green, bg = palette.bg },
    FzfLuaBufName = { fg = palette.blue, bg = palette.bg },

    -- Telescope
    TelescopeSelection = { fg = palette.fg, bg = palette.bg1 },

    -- Lazy
    LazyNormal = { fg = palette.fg, bg = palette.bg },
    LazyH1 = { fg = palette.bg, bg = palette.blue },
    LazyButtonActive = { fg = palette.bg, bg = palette.blue },

    -- Mason
    MasonNormal = { fg = palette.fg, bg = palette.bg },

    -- Mvim-bqf
    BqfPreviewRange = { fg = palette.bg, bg = palette.orange },

    -- Nvim-notify
    NotifyERRORBorder = { fg = palette.fg1, bg = palette.bg },
    NotifyWARNBorde = { fg = palette.fg1, bg = palette.bg },
    NotifyINFOBorder = { fg = palette.fg1, bg = palette.bg },
    NotifyDEBUGBorder = { fg = palette.fg1, bg = palette.bg },
    NotifyTRACEBorder = { fg = palette.fg1, bg = palette.bg },
    NotifyERRORIcon = { fg = palette.red, bg = palette.bg },
    NotifyWARNIcon = { fg = palette.orange, bg = palette.bg },
    NotifyINFOIcon = { fg = palette.green, bg = palette.bg },
    NotifyDEBUGIcon = { fg = palette.blue, bg = palette.bg },
    NotifyTRACEIcon = { fg = palette.blue, bg = palette.bg },
    NotifyERRORTitle = { fg = palette.red, bg = palette.bg },
    NotifyWARNTitle = { fg = palette.orange, bg = palette.bg },
    NotifyINFOTitle = { fg = palette.green, bg = palette.bg },
    NotifyDEBUGTitle = { fg = palette.blue, bg = palette.bg },
    NotifyTRACETitle = { fg = palette.blue, bg = palette.bg },
    NotifyERRORBody = { fg = palette.fg1, bg = palette.bg },
    NotifyWARNBody = { fg = palette.fg1, bg = palette.bg },
    NotifyINFOBody = { fg = palette.fg1, bg = palette.bg },
    NotifyDEBUGBody = { fg = palette.fg1, bg = palette.bg },
    NotifyTRACEBody = { fg = palette.fg1, bg = palette.bg },
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return M
