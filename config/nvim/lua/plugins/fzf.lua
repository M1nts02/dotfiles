local keys = {
  {
    "<Space>ff",
    "<CMD>FZF --reverse<CR>",
    desc = "File",
  },
}

local config = function()
  vim.g.fzf_layout = { window = { width = 0.7, height = 0.6 } }
  vim.g.fzf_colors = {
    ["fg"] = { "fg", "Normal" },
    ["bg"] = { "bg", "Normal" },
    ["hl"] = { "fg", "Comment" },
    ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
    ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
    ["hl+"] = { "fg", "Statement" },
    ["info"] = { "fg", "PreProc" },
    ["border"] = { "fg", "Ignore" },
    ["prompt"] = { "fg", "Conditional" },
    ["pointer"] = { "fg", "Exception" },
    ["marker"] = { "fg", "Keyword" },
    ["spinner"] = { "fg", "Label" },
    ["header"] = { "fg", "Comment" },
  }
end

return {
  "junegunn/fzf",
  version = "*",
  build = "fzf#install()",
  cmd = { "FZF" },
  keys = keys,
  config = config,
}
