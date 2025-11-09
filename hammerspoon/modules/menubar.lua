local menuIcon = hs.menubar.new()

menuIcon:setTitle "❖"

menuIcon:setMenu {
  {
    title = "Ghostty",
    fn = function()
      hs.execute "open -a Ghostty -n"
    end,
  },
  {
    title = "Dark Mode",
    fn = function()
      hs.shortcuts.run "暗色模式"
      hs.notify.new():title("Toggle dark mode"):subTitle("Done!"):send()
    end,
  },
  {
    title = "Finder",
    fn = function()
      hs.application.launchOrFocus "Finder"
    end,
  },
  {
    title = "Safari",
    fn = function()
      hs.application.launchOrFocus "Safari"
    end,
  },
  {
    title = "App Store",
    fn = function()
      hs.application.launchOrFocus "App Store"
    end,
  },
  {
    title = "QuickRecorder",
    fn = function()
      hs.application.launchOrFocus "QuickRecorder"
    end,
  },
  {
    title = "Evermusic",
    fn = function()
      hs.application.launchOrFocus "Evermusic"
    end,
  },
  {
    title = "Screenshot(Clipboard)",
    fn = function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      hs.task.new("/usr/sbin/screencapture", nil, { "-cio", fileName }):start()
    end,
  },
  {
    title = "Screenshot(Screen)",
    fn = function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      hs.task.new("/usr/sbin/screencapture", nil, { fileName }):start()
      hs.notify.new():title("Screenshot"):subTitle(fileName):send()
    end,
  },
  {
    title = "Screenshot(Area)",
    fn = function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      hs.task.new("/usr/sbin/screencapture", nil, { "-io", fileName }):start()
    end,
  },
  {
    title = "Screenshot(App)",
    fn = function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      local windowId = hs.window.frontmostWindow():id()
      hs.task.new("/usr/sbin/screencapture", nil, { "-l" .. windowId, fileName }):start()
      hs.notify.new():title("Screenshot"):subTitle(fileName):send()
    end,
  },
  {
    title = "Trash",
    fn = function()
      hs.osascript.applescript [[
tell application "Finder"
  open trash
  set the current view of the front Finder window to list view
  activate
end tell
]]
    end,
  },
  {
    title = "ScreenSaver",
    fn = function()
      hs.osascript.applescript 'tell application "ScreenSaverEngine" to run'
    end,
  },
  {
    title = "Reload Hammerspoon",
    fn = function()
      hs.reload()
      hs.notify.new():title("Reload"):subTitle("Hammerspoon reload done!"):send()
    end,
  },
}
