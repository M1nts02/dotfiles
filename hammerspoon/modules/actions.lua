local terminal = "/Applications/Ghostty.app/Contents/MacOS/ghostty --window-decoration=none"

return {
  ["Nvim"] = {
    run = function()
      hs.execute(
        "nohup "
          .. terminal
          .. " --title=Neovim"
          .. " --window-save-state=never"
          .. " --keybind=cmd+n=unbind"
          .. " --keybind=cmd+d=text:\x1b\x17v"
          .. " --keybind=cmd+shift+d=text:\x1b\x17s"
          .. " --keybind=cmd+w=text:\x1b\x17q"
          .. " --keybind=cmd+j=text:\x1c"
          .. " --keybind=cmd+left=text:\x1b\x17h"
          .. " --keybind=cmd+right=text:\x1b\x17l"
          .. " --keybind=cmd+up=text:\x1b\x17k"
          .. " --keybind=cmd+down=text:\x1b\x17j"
          .. " --keybind=cmd+t=text:\x1b\x17e"
          .. " --keybind=cmd+digit_1=text:\x1b\x171"
          .. " --keybind=cmd+digit_2=text:\x1b\x172"
          .. " --keybind=cmd+digit_3=text:\x1b\x173"
          .. " --keybind=cmd+digit_4=text:\x1b\x174"
          .. " --keybind=cmd+digit_5=text:\x1b\x175"
          .. " --keybind=cmd+digit_6=text:\x1b\x176"
          .. " --keybind=cmd+digit_7=text:\x1b\x177"
          .. " --keybind=cmd+digit_8=text:\x1b\x178"
          .. " --keybind=cmd+digit_9=text:\x1b\x179"
          .. " --keybind=cmd+digit_0=text:\x1b\x170"
          .. " --keybind=cmd+f=text:\x1b/"
          .. " --keybind=cmd+shift+p=text:\x1b:"
          .. " -e nvim > /tmp/nvim.log &",
        true
      )
    end,
    image = hs.image.imageFromPath "icons/coding-html-development-language-programming.ico",
  },
  ["Reload"] = {
    run = function()
      hs.reload()
      hs.notify.new():title("Reload"):subTitle("Hammerspoon reloading..."):send()
    end,
    image = hs.image.imageFromAppBundle "org.hammerspoon.Hammerspoon",
  },
  ["Dark Mode"] = {
    run = function()
      hs.osascript.applescript [[
tell application "System Events"
    tell appearance preferences
        set dark mode to not dark mode
    end tell
end tell
    ]]
    end,
    image = hs.image.imageFromPath "icons/color-contrast-design-tool.ico",
  },
  ["Finder"] = {
    run = function()
      hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app"
    end,
    image = hs.image.imageFromAppBundle "com.apple.finder",
  },
  ["Trash"] = {
    run = function()
      hs.osascript.applescript [[
tell application "Finder"
  open trash
  set the current view of the front Finder window to list view
  activate
end tell
]]
    end,
    image = hs.image.imageFromPath "icons/delete-dustbin-empty-recycle-recycling-remove-trash.ico",
  },
  ["ScreenSaver"] = {
    run = function()
      hs.osascript.applescript 'tell application "ScreenSaverEngine" to run'
    end,
    image = hs.image.imageFromPath "icons/computer-device-internet-laptop-netbook-notebook-pc.ico",
  },
  ["Screenshot Clipboard"] = {
    run = function()
      utils.ScreenShot { mode = "Clipboard" }
    end,
    image = hs.image.imageFromAppBundle "com.apple.screenshot.launcher",
  },
  ["Screenshot Screen"] = {
    run = function()
      utils.ScreenShot { mode = "Screen", notify = true }
    end,
    image = hs.image.imageFromAppBundle "com.apple.screenshot.launcher",
  },
  ["Screenshot Area"] = {
    run = function()
      utils.ScreenShot { mode = "Area" }
    end,
    image = hs.image.imageFromAppBundle "com.apple.screenshot.launcher",
  },
  ["Screenshot App"] = {
    run = function()
      utils.ScreenShot { mode = "App", notify = true }
    end,
    image = hs.image.imageFromAppBundle "com.apple.screenshot.launcher",
  },
  ["Window Maximize"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
    end,
    image = hs.image.imageFromPath "icons/interface-layout-multi-column-design-column-website.ico",
  },
  ["Window Center"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.175, 0.125, 0.65, 0.75 }
    end,
    image = hs.image.imageFromPath "icons/interface-layout-multi-column-design-column-website.ico",
  },
  ["Window Left"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }
    end,
    image = hs.image.imageFromPath "icons/interface-layout-multi-column-design-column-website.ico",
  },
  ["Window Right"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }
    end,
    image = hs.image.imageFromPath "icons/interface-layout-multi-column-design-column-website.ico",
  },
  ["Window Default"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.65, 0.7 }
    end,
    image = hs.image.imageFromPath "icons/interface-layout-multi-column-design-column-website.ico",
  },
  ["Play"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
      hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
    end,
  },
  ["Prev"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
    end,
  },
  ["Next"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
      hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
    end,
  },
  ["Mute Toggle"] = {
    run = function()
      local device = hs.audiodevice.defaultOutputDevice()
      local muted = device:muted()
      device:setMuted(not muted)
    end,
  },
  ["Volume Up"] = {
    run = function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current + 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
  },
  ["Volume Down"] = {
    run = function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current - 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
  },
  ["Rime"] = {
    run = function()
      hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
      hs.eventtap.keyStroke({ "control", "shift" }, "f4")
    end,
    pass = true,
  },
  ["FlashSpace Move to 1"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space1")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 2"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space2")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 3"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space3")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 4"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space4")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 5"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space5")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 6"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space6")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 7"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space7")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 8"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space8")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
  ["FlashSpace Move to 9"] = {
    run = function()
      utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space9")
    end,
    image = hs.image.imageFromPath "icons/add-new-plus-maximize-window-tab.ico",
  },
}
