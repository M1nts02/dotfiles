local M = {}

function M.toggle_screensaver()
  hs.osascript.applescript [[tell application "ScreenSaverEngine" to run]]
end

return M
