local M = {}

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
    m[4] = m[4] or {}
    m[4]["noremap"] = m[4]["noremap"] or true

    if m.enabled == false then
      goto continue
    end

    local mode = {}
    if type(m[1]) == "table" then
      mode = m[1]
    elseif type(m[1]) == "string" then
      for char in string.gmatch(m[1], ".") do
        table.insert(mode, char)
      end
    end
    vim.keymap.set(mode, m[2], m[3], m[4])

    ::continue::
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

--- A function to complete plugin name
function M.plugins_complete(arglead, cmdline, cursorpos)
  local plugins = vim.pack.get() or {}
  local names = {}
  for _, plugin in ipairs(plugins) do
    local name = plugin.spec and plugin.spec.name
    if name and (arglead == "" or name:find(arglead, 1, true) == 1) then
      table.insert(names, name)
    end
  end
  return names
end

return M
