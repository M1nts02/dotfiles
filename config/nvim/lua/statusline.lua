function _G.statusline()
  local left = {}

  local ok, dbg = pcall(function()
    return require("debugmaster.debug.mode").is_active()
  end)
  if ok and dbg then
    table.insert(left, "%#DiagnosticWarn#[DEBUG]")
  else
    table.insert(left, "%#DiagnosticWarn#")
  end

  local n = vim.fn.tabpagenr("$")
  local cur = vim.fn.tabpagenr()
  local file_part = "%#Function#%t"
  if n > 1 then
    file_part = file_part .. " [%#Function#" .. cur .. "/" .. n .. "]"
  end
  table.insert(left, file_part)
  table.insert(left, "%=")
  table.insert(left, "%S")

  local right = {}

  local counts = vim.diagnostic.count(0)
  if counts and next(counts) ~= nil then
    local diag_parts = {}
    if counts[vim.diagnostic.severity.ERROR] and counts[vim.diagnostic.severity.ERROR] > 0 then
      table.insert(diag_parts, "%#DiagnosticError#E:" .. counts[vim.diagnostic.severity.ERROR])
    end
    if counts[vim.diagnostic.severity.WARN] and counts[vim.diagnostic.severity.WARN] > 0 then
      table.insert(diag_parts, "%#DiagnosticWarn#W:" .. counts[vim.diagnostic.severity.WARN])
    end
    if counts[vim.diagnostic.severity.INFO] and counts[vim.diagnostic.severity.INFO] > 0 then
      table.insert(diag_parts, "%#DiagnosticInfo#I:" .. counts[vim.diagnostic.severity.INFO])
    end
    if counts[vim.diagnostic.severity.HINT] and counts[vim.diagnostic.severity.HINT] > 0 then
      table.insert(diag_parts, "%#Comment#H:" .. counts[vim.diagnostic.severity.HINT])
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
    table.insert(right, "%#String# " .. table.concat(names, ", "))
  end

  local enc = vim.bo.fileencoding
  if enc == "" then
    enc = vim.o.encoding
  end
  table.insert(right, "%#Character#" .. enc)

  table.insert(right, "%#Function#%l:%c")
  table.insert(right, "%P")

  return table.concat(left, "  ") .. " " .. table.concat(right, "  ")
end

vim.o.statusline = "%!v:lua.statusline()"
