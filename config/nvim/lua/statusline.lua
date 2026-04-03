local function set_hl()
  local palette = require("colorscheme.palette")
  local p = palette[vim.o.background] or palette.light
  local bg = vim.api.nvim_get_hl(0, { name = "Normal", id = 0 }).bg == nil and "NONE" or
      (vim.o.background == "light" and "#fafafa" or "#1E1E2E")

  vim.api.nvim_set_hl(0, "StatusLineDebug", { fg = p.orange, bg = bg, bold = true })
  vim.api.nvim_set_hl(0, "StatusLineFile", { fg = p.blue, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLineDiagError", { fg = p.red, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLineDiagWarn", { fg = p.yellow, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLineDiagInfo", { fg = p.blue, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLineDiagHint", { fg = p.fg1, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLineLsp", { fg = p.green, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLineEnc", { fg = p.cyan, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLinePos", { fg = p.blue, bg = bg })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_hl,
})

set_hl()

function _G.statusline()
  local left = {}

  local ok, dbg = pcall(function()
    return require("debugmaster.debug.mode").is_active()
  end)
  if ok and dbg then
    table.insert(left, "%#StatusLineDebug#[DEBUG]")
  else
    table.insert(left, "%#StatusLineDebug#")
  end

  local n = vim.fn.tabpagenr("$")
  local cur = vim.fn.tabpagenr()
  local file_part = "%#StatusLineFile#%t"
  if n > 1 then
    file_part = file_part .. " [%#StatusLineFile#" .. cur .. "/" .. n .. "]"
  end
  table.insert(left, file_part)
  table.insert(left, "%=")
  table.insert(left, "%S")

  local right = {}

  local counts = vim.diagnostic.count(0)
  if counts and next(counts) ~= nil then
    local diag_parts = {}
    if counts[vim.diagnostic.severity.ERROR] and counts[vim.diagnostic.severity.ERROR] > 0 then
      table.insert(diag_parts, "%#StatusLineDiagError#E:" .. counts[vim.diagnostic.severity.ERROR])
    end
    if counts[vim.diagnostic.severity.WARN] and counts[vim.diagnostic.severity.WARN] > 0 then
      table.insert(diag_parts, "%#StatusLineDiagWarn#W:" .. counts[vim.diagnostic.severity.WARN])
    end
    if counts[vim.diagnostic.severity.INFO] and counts[vim.diagnostic.severity.INFO] > 0 then
      table.insert(diag_parts, "%#StatusLineDiagInfo#I:" .. counts[vim.diagnostic.severity.INFO])
    end
    if counts[vim.diagnostic.severity.HINT] and counts[vim.diagnostic.severity.HINT] > 0 then
      table.insert(diag_parts, "%#StatusLineDiagHint#H:" .. counts[vim.diagnostic.severity.HINT])
    end
    if #diag_parts > 0 then
      table.insert(right, table.concat(diag_parts, " "))
    end
  end

  local clients = vim.lsp.get_clients { bufnr = 0 }
  if #clients > 0 then
    local names = {}
    for _, client in ipairs(clients) do
      table.insert(names, client.name)
    end
    table.insert(right, "%#StatusLineLsp# " .. table.concat(names, ", "))
  end

  local enc = vim.bo.fileencoding
  if enc == "" then
    enc = vim.o.encoding
  end
  table.insert(right, "%#StatusLineEnc#" .. enc)

  table.insert(right, "%#StatusLinePos#%l:%c")
  table.insert(right, "%P")

  return table.concat(left, "  ") .. " " .. table.concat(right, "  ")
end

vim.o.statusline = "%!v:lua.statusline()"
