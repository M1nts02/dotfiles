hs.loadSpoon "RecursiveBinder"
hs.loadSpoon "ModalMgr"

local singleKey = spoon.RecursiveBinder.singleKey

return {
  mods = { "command" },
  key = "space",
  message = {
    -- English
    [singleKey("1", "English")] = function()
      hs.keycodes.currentSourceID "com.apple.keylayout.ABC"
    end,
    -- Chinese
    [singleKey("2", "Chinese")] = function()
      hs.keycodes.currentSourceID "com.apple.inputmethod.SCIM.ITABC"
    end,
    -- Japanese
    [singleKey("3", "Japanese")] = function()
      hs.keycodes.currentSourceID "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese"
    end,

    -- LaunchPad
    [singleKey("space", "LaunchPad")] = function()
      hs.spaces.toggleLaunchPad()
    end,

    -- Mission Control
    [singleKey("m", "Mission")] = function()
      hs.spaces.toggleMissionControl()
    end,

    -- Dock
    [singleKey("d", "Dock")] = function()
      hs.eventtap.keyStroke({ "fn" }, "a")
    end,

    -- Emoji
    [singleKey("e", "Emoji")] = function()
      hs.eventtap.keyStroke({ "fn" }, "e")
    end,

    -- Screenshot
    [singleKey("4", "Screenshot+")] = {
      [singleKey("5", "App")] = function()
        local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
        local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
        local windowId = hs.window.frontmostWindow():id()
        hs.task.new("/usr/sbin/screencapture", nil, { "-l" .. windowId, fileName }):start()
      end,
      [singleKey("4", "Area")] = function()
        local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
        local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
        hs.task.new("/usr/sbin/screencapture", nil, { "-io", fileName }):start()
      end,
      [singleKey("3", "Screen")] = function()
        local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
        local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
        hs.task.new("/usr/sbin/screencapture", nil, { fileName }):start()
      end,
      [singleKey("2", "Clipboard")] = function()
        local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
        local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
        hs.task.new("/usr/sbin/screencapture", nil, { "-cio", fileName }):start()
      end,
    },

    [singleKey("a", "Applications+")] = {
      -- Terminal
      [singleKey("t", "Terminal")] = function()
        hs.application.launchOrFocus "Wezterm"
      end,

      -- Browser
      [singleKey("b", "Brave")] = function()
        hs.application.launchOrFocus "Brave Browser"
      end,

      -- Vscode
      [singleKey("c", "Vscode")] = function()
        hs.application.launchOrFocus "Visual Studio Code"
      end,

      -- Finder
      [singleKey("f", "Finder")] = function()
        hs.application.launchOrFocus "Finder"
      end,

      -- Tools
      [singleKey("m", "DarkMode")] = function()
        hs.shortcuts.run "切换黑暗模式"
      end,
    },

    -- Window
    [singleKey("w", "Window+")] = {
      [singleKey("w", "Windows")] = function()
        spoon.ModalMgr:deactivateAll()
        hs.hints.windowHints()
      end,
      [singleKey("o", "Maximize")] = function()
        hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
      end,
      [singleKey("f", "Float")] = function()
        hs.window.focusedWindow():moveToUnit { 0.075, 0.075, 0.85, 0.85 }
      end,
      [singleKey("k", "Up")] = function()
        hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.4925 }
      end,
      [singleKey("j", "Down")] = function()
        hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.99, 0.4925 }
      end,
      [singleKey("h", "Left")] = function()
        hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }
      end,
      [singleKey("l", "Right")] = function()
        hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }
      end,
    },
  },
}
