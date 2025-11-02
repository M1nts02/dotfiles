return {
  ["Dark Mode"] = function()
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
