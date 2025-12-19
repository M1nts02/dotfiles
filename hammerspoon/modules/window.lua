-------------------- Hammerspoon Switcher -----------------------
local wf = hs.window.filter
--switchWindows = hs.window.switcher.new(wf.new():setDefaultFilter {}, {
--  showThumbnails = false,
--  showSelectedThumbnail = true,
--  onlyActiveApplication = false,
--  textColor = { 0.9, 0.9, 0.9 },
--  highlightColor = { 0.3, 0.3, 0.3, 1 },
--  backgroundColor = { 0.5, 0.5, 0.5, 1 },
--  showTitles = false,
--  titleBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--  showSelectedTitle = true,
--  closeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--  minimizeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--})
--
--hs.hotkey.bind("alt", "tab", "Next window", function()
--  switchWindows:next()
--  hs.alert.closeAll()
--end)
--hs.hotkey.bind({ "alt", "shift" }, "tab", "Prev window", function()
--  switchWindows:previous()
--  hs.alert.closeAll()
--end)

switchWindowsCurrentSpace = hs.window.switcher.new(wf.new():setCurrentSpace(true):setDefaultFilter {}, {
  showThumbnails = false,
  showSelectedThumbnail = true,
  onlyActiveApplication = false,
  textColor = { 0.9, 0.9, 0.9 },
  highlightColor = { 0.3, 0.3, 0.3, 1 },
  backgroundColor = { 0.5, 0.5, 0.5, 1 },
  showTitles = false,
  titleBackgroundColor = { 0.5, 0.5, 0.5, 1 },
  showSelectedTitle = true,
  closeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
  minimizeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
})

hs.hotkey.bind("alt", "tab", "Next window", function()
  switchWindowsCurrentSpace:next()
  hs.alert.closeAll()
end)
hs.hotkey.bind({ "alt", "shift" }, "tab", "Prev window", function()
  switchWindowsCurrentSpace:previous()
  hs.alert.closeAll()
end)

--------------------------- Window ------------------------------
hs.hotkey.bind({ "ctrl", "cmd" }, ",", actions["Window Left"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, ".", actions["Window Right"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, "o", actions["Window Maximize"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, "c", actions["Window Center"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, "t", actions["Window Default"].run)
