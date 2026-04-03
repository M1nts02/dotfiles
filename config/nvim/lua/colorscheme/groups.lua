local M = {}

M.set_groups_hl = function(palette)
  local bg = palette.bg
  local bg1 = palette.bg1
  local bg2 = palette.bg2
  local fg = palette.fg
  local fg1 = palette.fg1
  local fg2 = palette.fg2
  local fg3 = palette.fg3
  local cyan = palette.cyan
  local blue = palette.blue
  local green = palette.green
  local orange = palette.orange
  local yellow = palette.yellow
  local purple = palette.purple
  local indian_red = palette.indian_red
  local red = palette.red
  local pink = palette.pink

  local groups = {
    -- Base.
    Normal = { fg = fg, bg = bg },
    NormalNC = { fg = fg, bg = bg },
    NormalSB = { fg = fg, bg = bg2 },
    -- NormalFloat = { bg = bg1 },
    NormalFloat = { bg = bg },
    FloatBorder = { fg = blue, bg = bg },
    FloatTitle = { fg = fg1, bg = bg },

    Pmenu = { fg = fg, bg = bg },
    PmenuBorder = { fg = blue, bg = bg },
    PmenuSel = { fg = bg, bg = blue },
    PmenuSbar = { fg = fg, bg = bg },
    PmenuThumb = { bg = blue },
    PmenuMatch = { fg = indian_red },
    PmenuMatchSel = { fg = indian_red },

    Question = { fg = blue },
    QuickFixLine = { fg = fg1, bold = true },

    Search = { fg = bg2, bg = blue },
    IncSearch = { fg = bg, bg = blue },
    CurSearch = { fg = bg2, bg = pink },

    SpecialKey = { fg = fg2 },
    SnippetTabstop = { bg = bg2 },
    SpellBad = { sp = red, undercurl = true },
    SpellCap = { sp = yellow, undercurl = true },
    SpellLocal = { sp = blue, undercurl = true },
    SpellRare = { sp = green, undercurl = true },

    StatusLine = { fg = fg, bg = bg1 },
    StatusLineNC = { fg = fg2, bg = bg1 },
    TabLine = { fg = fg2, bg = bg1 },
    TabLineFill = {},
    TabLineSel = { fg = green, bg = bg2 },

    Title = { fg = blue, bold = true },
    Visual = { fg = bg, bg = pink },
    VisualNOS = { fg = bg, bg = pink, bold = true },

    WarningMsg = { fg = yellow },
    Whitespace = { fg = fg3, bg = bg },
    WildMenu = { fg = bg, bg = blue },

    WinBar = { fg = orange },
    WinBarNC = { fg = orange },
    WinSeparator = { fg = fg3 },

    ColorColumn = { bg = bg1 },
    Conceal = { fg = fg1 },
    Cursor = { fg = bg1, bg = fg },
    lCursor = { fg = bg, bg = fg },
    CursorIM = { fg = bg, bg = fg },
    CursorColumn = { bg = bg1 },
    CursorLine = { bg = bg1 },

    Directory = { fg = blue },
    EndOfBuffer = { fg = fg },
    ErrorMsg = { fg = red, bold = true, italic = true },
    VertSplit = { fg = blue, bg = bg },

    Folded = { fg = blue, bg = bg1 },
    FoldColumn = { fg = fg2, bg = bg1 },

    SignColumn = { fg = fg1, bg = bg },
    SignColumnSB = { fg = bg2, bg = bg2 },
    Substitute = { fg = pink, bg = fg3 },

    LineNr = { fg = cyan, bg = bg },
    CursorLineNr = { fg = blue, bg = bg2 },

    MatchParen = { fg = orange, bg = bg2, bold = true },
    ModeMsg = { fg = fg },
    MsgSeparator = {},
    MoreMsg = { fg = blue },
    NonText = { fg = fg2 },

    Comment = { fg = fg1, italic = true },
    SpecialComment = { fg = pink },
    Constant = { fg = orange },
    String = { fg = green },
    Character = { fg = cyan },
    Number = { fg = orange },

    Float = { fg = orange },
    Boolean = { fg = orange },
    Identifier = { fg = indian_red },
    Function = { fg = blue },
    Statement = { fg = purple },
    Conditional = { fg = purple },
    Repeat = { fg = purple },
    Label = { fg = cyan },
    Operator = { fg = blue },
    Keyword = { fg = purple },
    Exception = { fg = purple, italic = true },
    PreProc = { fg = pink },
    Include = { fg = purple },
    Define = { fg = pink },
    Macro = { fg = purple },
    PreCondit = { fg = pink },
    StorageClass = { fg = yellow },
    Structure = { fg = yellow },
    Special = { fg = pink },
    Type = { fg = yellow },
    TypeDef = { fg = yellow },
    SpecialChar = { fg = pink },
    Tag = { fg = blue, bold = true },
    Delimiter = { fg = fg2 },
    Debug = { fg = pink },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = {},
    Error = { fg = red },

    qfLineNr = { fg = yellow },
    qfFileName = { fg = blue },

    htmlH1 = { fg = pink, bold = true },
    htmlH2 = { fg = blue, bold = true },

    mkdCodeDelimiter = { fg = fg, bg = bg },
    mkdCodeStart = { fg = indian_red, bold = true },
    mkdCodeEnd = { fg = indian_red, bold = true },
    mkdLink = { fg = blue, underline = true },

    debugPC = { bg = bg2 },
    debugBreakpoint = { fg = fg2, bg = bg },

    illuminatedWord = { bg = fg3 },
    illuminatedCurWord = { bg = fg3 },

    diffAdded = { fg = green },
    diffRemoved = { fg = red },
    diffanged = { fg = blue },
    diffOldFile = { fg = yellow },
    diffNewFile = { fg = orange },
    diffFile = { fg = blue },
    diffLine = { fg = fg2 },
    diffIndexLine = { fg = cyan },
    DiffAdd = { fg = bg, bg = green },
    DiffChange = { fg = bg, bg = blue },
    DiffDelete = { fg = bg, bg = red },
    DiffText = { fg = bg, bg = blue },

    healthError = { fg = red },
    healthSuccess = { fg = cyan },
    healthWarning = { fg = yellow },

    GlyphPalette1 = { fg = red },
    GlyphPalette2 = { fg = cyan },
    GlyphPalette3 = { fg = yellow },
    GlyphPalette4 = { fg = blue },
    GlyphPalette6 = { fg = cyan },
    GlyphPalette7 = { fg = fg },
    GlyphPalette9 = { fg = red },

    rainbow1 = { fg = red },
    rainbow2 = { fg = orange },
    rainbow3 = { fg = yellow },
    rainbow4 = { fg = green },
    rainbow5 = { fg = blue },
    rainbow6 = { fg = cyan },

    -- LSP.
    DiagnosticError = { fg = red },
    DiagnosticWarn = { fg = yellow },
    DiagnosticHint = { fg = fg1 },
    DiagnosticInfo = { fg = blue },
    DiagnosticVirtualTextError = { fg = red },
    DiagnosticVirtualTextWarn = { fg = yellow },
    DiagnosticVirtualTextHint = { fg = fg1 },
    DiagnosticVirtualTextInfo = { fg = blue },
    DiagnosticUnderlineError = { sp = red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = yellow, undercurl = true },
    DiagnosticUnderlineHint = { sp = fg1, undercurl = true, italic = true },
    DiagnosticUnderlineInfo = { sp = blue, undercurl = true, italic = true },
    DiagnosticSignError = { fg = red },
    DiagnosticSignWarn = { fg = yellow },
    DiagnosticSignHint = { fg = fg1 },
    DiagnosticSignInfo = { fg = blue },
    DiagnosticDeprecated = { sp = fg1, strikethrough = true, italic = true },

    -- Markdown.
    markdownCode = { fg = green },

    -- TreeSitter.
    ["@property"] = { fg = pink },
    ["@field"] = { fg = blue },
    ["@parameter"] = { fg = fg },
    ["@namespace"] = { fg = cyan },
    ["@variable.builtin"] = { fg = green },
    ["@text.title"] = { fg = indian_red },
    ["@type.qualifier"] = { fg = orange },
    ["@storageclass"] = { fg = orange },
    ["@tag"] = { fg = yellow },
    ["@tag.attribute"] = { fg = cyan },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@variable"] = { fg = yellow },

    -- SemanticToken
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
    ["@lsp.type.interface"] = { fg = indian_red },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { link = "@error" },
    ["@lsp.type.variable"] = {},
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },

    -- Gitsigns.
    GitSignsAddLn = { fg = green },
    GitSignsDeleteLn = { fg = yellow },
    GitSignsChange = { fg = indian_red },

    -- Blink.cmp
    BlinkCmpMenu = { fg = fg1, bg = bg },
    BlinkCmpMenuBorder = { fg = blue, bg = bg },
    BlinkCmpDocBorder = { fg = blue, bg = bg },
    BlinkCmpSignatureHelpBorder = { fg = blue, bg = bg },
    BlinkCmpMenuSelection = { fg = blue, bg = bg1, bold = true },

    BlinkCmpLabelMatch = { fg = blue, bg = "NONE" },
    BlinkCmpLabelDeprecated = { fg = fg1, bg = "NONE", strikethrough = true },

    BlinkCmpLabelDetail = { fg = purple, bg = "NONE", italic = true },
    BlinkCmpLabelDescription = { fg = purple, bg = "NONE", italic = true },
    BlinkCmpSource = { fg = purple, bg = "NONE", italic = true },

    BlinkCmpKindField = { fg = bg, bg = indian_red },
    BlinkCmpKindProperty = { fg = bg, bg = indian_red },
    BlinkCmpKindEvent = { fg = bg, bg = indian_red },
    BlinkCmpKindText = { fg = bg, bg = green },
    BlinkCmpKindEnum = { fg = bg, bg = green },
    BlinkCmpKindKeyword = { fg = bg, bg = green },
    BlinkCmpKindConstant = { fg = bg, bg = orange },
    BlinkCmpKindConstructor = { fg = bg, bg = orange },
    BlinkCmpKindReference = { fg = bg, bg = orange },
    BlinkCmpKindFunction = { fg = bg, bg = purple },
    BlinkCmpKindStruct = { fg = bg, bg = purple },
    BlinkCmpKindClass = { fg = bg, bg = purple },
    BlinkCmpKindModule = { fg = bg, bg = purple },
    BlinkCmpKindOperator = { fg = bg, bg = purple },
    BlinkCmpKindVariable = { fg = bg, bg = fg },
    BlinkCmpKindFile = { fg = bg, bg = fg },
    BlinkCmpKindUnit = { fg = bg, bg = yellow },
    BlinkCmpKindSnippet = { fg = bg, bg = yellow },
    BlinkCmpKindFolder = { fg = bg, bg = yellow },
    BlinkCmpKindMethod = { fg = bg, bg = blue },
    BlinkCmpKindValue = { fg = bg, bg = blue },
    BlinkCmpKindEnumMember = { fg = bg, bg = blue },
    BlinkCmpKindInterface = { fg = bg, bg = cyan },
    BlinkCmpKindColor = { fg = bg, bg = cyan },
    BlinkCmpKindTypeParameter = { fg = bg, bg = cyan },
    BlinkCmpKindFittenCode = { fg = bg, bg = blue },

    -- Word under cursor.
    CursorWord = { bg = blue },
    CursorWord0 = { bg = blue },
    CursorWord1 = { bg = blue },

    -- WhichKey.
    WhichKeyFloat = { fg = fg, bg = bg },
    WhichKeyBorder = { fg = blue, bg = bg },

    -- Mini.nvim
    MiniHipatternsFixme = { fg = bg, bg = red },
    MiniHipatternsHack = { fg = bg, bg = orange },
    MiniHipatternsTodo = { fg = bg, bg = blue },
    MiniHipatternsNote = { fg = bg, bg = fg1 },
    MiniJump2dSpot = { fg = bg, bg = blue },
    MiniPickMatchRanges = { fg = indian_red },

    -- Snacks.nvim
    SnacksDashboardHeader = { fg = cyan },
    SnacksDashboardFooter = { fg = fg1 },
    SnacksDashboardDesc = { fg = purple },
    SnacksDashboardIcon = { fg = blue },

    -- Neogit.
    NeogitChangeDeleted = { fg = fg1, bg = bg },
    NeogitDiffContextHighlight = { bg = bg1 },
    NeogitHunkHeader = { fg = pink },
    NeogitHunkHeaderHighlight = { fg = pink, bg = bg1 },
    NeogitDiffAddHighlight = { fg = bg1, bg = green },
    NeogitDiffDeleteHighlight = { fg = bg1, bg = indian_red },
    NeogitDiffAdd = { fg = green, bg = bg },
    NeogitDiffDelete = { fg = indian_red, bg = bg },
    NeogitDiffContext = { fg = fg1, bg = bg },
    NeogitDiffHeader = { fg = fg1, bg = bg },

    -- Dap.
    NvimDapVirtualText = { fg = fg1 },

    -- DAP UI.
    DapUIScope = { fg = green },
    DapUIType = { fg = cyan },
    DapUIDecoration = { fg = blue },
    DapUIThread = { fg = green },
    DapUIStoppedThread = { fg = orange },
    DapUISource = { fg = green },
    DapUILineNumber = { fg = fg1 },
    DapUIFloatBorder = { fg = fg1 },
    DapUIWatchesEmpty = { fg = orange },
    DapUIWatchesValue = { fg = green },
    DapUIWatchesError = { fg = red },
    DapUIBreakpointsPath = { fg = green },
    DapUIBreakpointsInfo = { fg = fg1 },
    DapUIBreakpointsCurrentLine = { fg = fg1, bg = bg1, bold = true },

    -- Dashboard-nvim.
    DashboardHeader = { fg = cyan },
    DashboardFooter = { fg = fg1 },

    -- Fzf-lua
    FzfLuaHeaderBind = { fg = fg1, bg = bg },
    FzfLuaHeaderText = { fg = fg1, bg = bg },
    FzfLuaBufNr = { fg = indian_red },
    FzfLuaBufLineNr = { fg = green, bg = bg },
    FzfLuaBufName = { fg = blue, bg = bg },
    FzfLuaPathLineNr = { fg = green },

    -- Telescope
    TelescopeSelection = { fg = fg, bg = bg1 },
    TelescopeNormal = { fg = blue, bg = bg },

    -- Lazy
    LazyNormal = { fg = fg, bg = bg },
    LazyH1 = { fg = bg, bg = blue },
    LazyButtonActive = { fg = bg, bg = blue },

    -- Mason
    MasonNormal = { fg = fg, bg = bg },

    -- Nvim-notify
    NotifyERRORBorder = { fg = fg1, bg = bg },
    NotifyWARNBorde = { fg = fg1, bg = bg },
    NotifyINFOBorder = { fg = fg1, bg = bg },
    NotifyDEBUGBorder = { fg = fg1, bg = bg },
    NotifyTRACEBorder = { fg = fg1, bg = bg },
    NotifyERRORIcon = { fg = red, bg = bg },
    NotifyWARNIcon = { fg = orange, bg = bg },
    NotifyINFOIcon = { fg = green, bg = bg },
    NotifyDEBUGIcon = { fg = blue, bg = bg },
    NotifyTRACEIcon = { fg = blue, bg = bg },
    NotifyERRORTitle = { fg = red, bg = bg },
    NotifyWARNTitle = { fg = orange, bg = bg },
    NotifyINFOTitle = { fg = green, bg = bg },
    NotifyDEBUGTitle = { fg = blue, bg = bg },
    NotifyTRACETitle = { fg = blue, bg = bg },
    NotifyERRORBody = { fg = fg1, bg = bg },
    NotifyWARNBody = { fg = fg1, bg = bg },
    NotifyINFOBody = { fg = fg1, bg = bg },
    NotifyDEBUGBody = { fg = fg1, bg = bg },
    NotifyTRACEBody = { fg = fg1, bg = bg },

    -- Avante
    AvantePromptInputBorder = { link = "Normal" },
    AvanteConflictCurrent = { fg = bg, bg = blue },
    AvanteConflictIncoming = { fg = bg, bg = green },
    AvanteConflictCurrentLabel = { fg = bg, bg = blue },
    AvanteConflictIncomingLabel = { fg = bg, bg = green },
  }

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

return M
