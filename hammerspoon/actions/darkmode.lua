local M = {}

---@param mode boolean
function M.toggle_dark_mode(mode)
  if Utils.get_dark_mode() ~= mode then
    hs.osascript.applescript [[tell application "System Events" to tell appearance preferences to set dark mode to not dark mode]]
  end
end

return M
