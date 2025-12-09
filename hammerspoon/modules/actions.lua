local terminal = "/Applications/Ghostty.app/Contents/MacOS/ghostty --window-decoration=none"

return {
  ["Nvim"] = function()
    utils.flashSpaceMoveSpace("com.mitchellh.ghostty", utils.flashSpaceGetWorkspace())
    hs.execute(
      "nohup "
        .. terminal
        .. " --title=Neovim"
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
  ["Reload"] = function()
    hs.reload()
    hs.notify.new():title("Reload"):subTitle("Hammerspoon reloading..."):send()
  end,
  ["Dark Mode"] = function()
    hs.osascript.applescript [[
tell application "System Events"
    tell appearance preferences
        set dark mode to not dark mode
    end tell
end tell
    ]]
  end,
  ["Finder"] = function()
    utils.flashSpaceMoveSpace("com.apple.finder", utils.flashSpaceGetWorkspace())
    hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app"
  end,
  ["Trash"] = function()
    utils.flashSpaceMoveSpace("com.apple.finder", utils.flashSpaceGetWorkspace())
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
  ["Screenshot Clipboard"] = function()
    utils.ScreenShot { mode = "Clipboard" }
  end,
  ["Screenshot Screen"] = function()
    utils.ScreenShot { mode = "Screen", notify = true }
  end,
  ["Screenshot Area"] = function()
    utils.ScreenShot { mode = "Area" }
  end,
  ["Screenshot App"] = function()
    utils.ScreenShot { mode = "App", notify = true }
  end,
  ["FlashSpace Move to 1"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 1")
  end,
  ["FlashSpace Move to 2"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 2")
  end,
  ["FlashSpace Move to 3"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 3")
  end,
  ["FlashSpace Move to 4"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 4")
  end,
  ["FlashSpace Move to 5"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 5")
  end,
  ["FlashSpace Move to 6"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 6")
  end,
  ["FlashSpace Move to 7"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 7")
  end,
  ["FlashSpace Move to 8"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 8")
  end,
  ["FlashSpace Move to 9"] = function()
    utils.flashSpaceMoveSpace(hs.application.frontmostApplication():bundleID(), "Space 9")
  end,
  ["Window Maximize"] = function()
    hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
  end,
  ["Window Center"] = function()
    hs.window.focusedWindow():moveToUnit { 0.175, 0.125, 0.65, 0.75 }
  end,
  ["Window Up"] = function()
    hs.window.focusedWindow():moveToUnit { 0.075, 0.075, 0.85, 0.85 }
  end,
  ["Window Down"] = function()
    hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.99, 0.4925 }
  end,
  ["Window Left"] = function()
    hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }
  end,
  ["Window Right"] = function()
    hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }
  end,
  ["Window Top"] = function()
    hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.65, 0.7 }
  end,
  ["Window Upper Left"] = function()
    hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.4925 }
  end,
  ["Window Upper Right"] = function()
    hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.4925 }
  end,
  ["Window Lower Left"] = function()
    hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.4925, 0.4925 }
  end,
  ["Window Lower Right"] = function()
    hs.window.focusedWindow():moveToUnit { 0.5025, 0.5025, 0.4925, 0.4925 }
  end,
}
