local M = {}

--- Get highlight
---@param name string The group name
---@return string[]
function M.get_hl(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end

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

return M
