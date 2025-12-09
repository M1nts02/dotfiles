-------------------- Hammerspoon Switcher -----------------------
local switcher_currentSpace_onScreen = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true), {
  showThumbnails = false,
  showSelectedThumbnail = true,
  onlyActiveApplication = false,
  textColor = { 0.9, 0.9, 0.9 },
  highlightColor = { 0.3, 0.3, 0.3, 1 },
  backgroundColor = { 0.5, 0.5, 0.5, 1 },
  showTitles = false,
  titleBackgroundColor = { 0.5, 0.5, 0.5, 1 },
  showSelectedTitle = false,
  closeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
  minimizeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
})

hs.hotkey.bind("alt", "tab", "Next window", function()
  switcher_currentSpace_onScreen:next()
  hs.alert.closeAll()
end)
hs.hotkey.bind({ "alt", "shift" }, "tab", "Prev window", function()
  switcher_currentSpace_onScreen:previous()
  hs.alert.closeAll()
end)

-------------------- Resize -----------------------
hs.hotkey.bind({ "ctrl", "cmd" }, "o", nil, actions["Window Maximize"])
hs.hotkey.bind({ "ctrl", "cmd" }, "c", nil, actions["Window Center"])
hs.hotkey.bind({ "ctrl", "cmd" }, "k", nil, actions["Window Up"])
hs.hotkey.bind({ "ctrl", "cmd" }, "j", nil, actions["Window Down"])
hs.hotkey.bind({ "ctrl", "cmd" }, "h", nil, actions["Window Left"])
hs.hotkey.bind({ "ctrl", "cmd" }, "l", nil, actions["Window Right"])
hs.hotkey.bind({ "ctrl", "cmd" }, "t", nil, actions["Window Top"])
hs.hotkey.bind({ "ctrl", "cmd" }, "u", nil, actions["Window Upper Left"])
hs.hotkey.bind({ "ctrl", "cmd" }, "i", nil, actions["Window Upper Right"])
hs.hotkey.bind({ "ctrl", "cmd" }, "n", nil, actions["Window Lower Left"])
hs.hotkey.bind({ "ctrl", "cmd" }, "m", nil, actions["Window Lower Right"])
