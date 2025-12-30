local M = {}

function M.set_colorscheme()
  if vim.g.dark == true then
    vim.cmd("colorscheme " .. vim.g.dark_theme)
  else
    vim.cmd("colorscheme " .. vim.g.light_theme)
  end
end

--- A function to check Commands exist
---@param cmd string|string[] The commands
---@return boolean
function M.executable(cmd)
  if type(cmd) == "string" then
    return vim.fn.executable(cmd) == 1
  end

  for _, c in ipairs(cmd) do
    if vim.fn.executable(c) == 1 then
      return true
    end
  end

  return false
end

--- A function to set keymap
---@param maps table The table for set keymap
function M.setmap(maps)
  for _, m in ipairs(maps) do
    if m[4] == nil then
      m[4] = { noremap = true }
    end
    vim.keymap.set(m[1], m[2], m[3], m[4])
  end
end

--- A function to load json from file
---@param path string
function M.load_json_file(path)
  local file = io.open(path, "r")

  if file then
    local t = vim.json.decode(file:read "*a")
    file:close()
    return t
  else
    return nil
  end
end

--- A function to wirte json file
---@param path string
---@param t table
function M.update_json_file(path, t)
  t = type(t) == "table" and t or {}
  local file = io.open(path, "w")

  if file then
    local context = vim.json.encode(t)
    file:write(context)
    file:close()
  end
end

return M
