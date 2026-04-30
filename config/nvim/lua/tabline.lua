local function clean_ctrl_seqs(s)
  s = s:gsub("%%#[^#]*#", "")
  s = s:gsub("%%[%d]*T", "")
  s = s:gsub("%%[%d]*X", "")
  return s
end

function _G.tabline()
  local total = vim.fn.tabpagenr "$"
  local current = vim.fn.tabpagenr()
  local parts = {}

  local start_tab, end_tab
  if total <= 3 then
    start_tab, end_tab = 1, total
  else
    if current == 1 then
      start_tab, end_tab = 1, 3
    elseif current == total then
      start_tab, end_tab = total - 2, total
    else
      start_tab, end_tab = current - 1, current + 1
    end
  end

  for i = start_tab, end_tab do
    local hl = (i == current) and "%#Function#" or "%#TabLine#"
    local buflist = vim.fn.tabpagebuflist(i)
    local bufnr = buflist[1]
    local name = vim.fn.bufname(bufnr)
    local label = vim.fn.fnamemodify(name, ":t")
    if label == "" then
      label = "[No Name]"
    end

    table.insert(parts, "%" .. i .. "T" .. hl .. " " .. i .. ":" .. label .. " ")
  end

  local tabs = table.concat(parts, "")
  local tabs_width = vim.fn.strdisplaywidth(clean_ctrl_seqs(tabs))

  -- Right: current/total
  local right = "%#Function# [" .. current .. "/" .. total .. "] "
  local right_width = vim.fn.strdisplaywidth(clean_ctrl_seqs(right))

  local avail = vim.o.columns - right_width
  local pad = math.max(0, math.floor((avail - tabs_width) / 2))

  return "%#TabLineFill#" .. string.rep(" ", pad) .. tabs .. "%#TabLineFill#" .. string.rep(" ", math.max(0, avail - pad - tabs_width)) .. right .. "%T"
end

vim.o.tabline = "%!v:lua.tabline()"