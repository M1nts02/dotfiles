local menu = require "modules.menu.menu"

return {
  ["Dark Mode"] = function()
    local output =
      hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"

    if output == "true\n" then
      menu.color = {
        strokeColor = { white = 0.95, alpha = 0.9 },
        fillColor = { white = 0.95, alpha = 0.9 },
        textColor = { white = 0.5, alpha = 1 },
      }
    else
      menu.color = {
        strokeColor = { white = 0.05, alpha = 0.9 },
        fillColor = { white = 0.05, alpha = 0.9 },
        textColor = { white = 0.5, alpha = 1 },
      }
    end
    hs.shortcuts.run "暗色模式"
  end,
  ["Finder"] = function()
    hs.application.launchOrFocus "Finder"
  end,
  ["Screenshot(Clipboard)"] = function()
    local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
    local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
    hs.task.new("/usr/sbin/screencapture", nil, { "-cio", fileName }):start()
  end,
  ["Screenshot(Screen)"] = function()
    local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
    local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
    hs.task.new("/usr/sbin/screencapture", nil, { fileName }):start()
  end,
  ["Screenshot(Area)"] = function()
    local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
    local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
    hs.task.new("/usr/sbin/screencapture", nil, { "-io", fileName }):start()
  end,
  ["Screenshot(App)"] = function()
    local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
    local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
    local windowId = hs.window.frontmostWindow():id()
    hs.task.new("/usr/sbin/screencapture", nil, { "-l" .. windowId, fileName }):start()
  end,
  ["Trash"] = function()
    hs.osascript.applescript [[
tell application "Finder"
  open trash
  set the current view of the front Finder window to list view
  activate
end tell
]]
  end,
  ["ScreenSaver"] = function()
    hs.osascript.applescript 'tell application "ScreenSaverEngine" to run'
  end,
}
