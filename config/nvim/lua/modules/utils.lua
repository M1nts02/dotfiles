local M = {}

--- A function to copy file
---@param oldPath string The old file path
---@param newPath string The new file path
function M.copy_file(oldPath, newPath)
  local oldIcon, errorString = io.open(oldPath, "rb")
  assert(oldIcon ~= nil, errorString)
  local data = oldIcon:read "a"
  oldIcon:close()
  local newIcon = io.open(newPath, "wb")
  newIcon:write(data)
  newIcon:close()
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

return M
