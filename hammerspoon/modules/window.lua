-------------------- Hammerspoon Switcher -----------------------
--local switcher_currentSpace_onScreen = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true), {
--  showThumbnails = false,
--  showSelectedThumbnail = true,
--  onlyActiveApplication = false,
--  textColor = { 0.9, 0.9, 0.9 },
--  highlightColor = { 0.3, 0.3, 0.3, 1 },
--  backgroundColor = { 0.5, 0.5, 0.5, 1 },
--  showTitles = false,
--  titleBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--  showSelectedTitle = false,
--  closeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--  minimizeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--})
--
--hs.hotkey.bind("alt", "tab", "Next window", function()
--  switcher_currentSpace_onScreen:next()
--  hs.alert.closeAll()
--end)
--hs.hotkey.bind({ "alt", "shift" }, "tab", "Prev window", function()
--  switcher_currentSpace_onScreen:previous()
--  hs.alert.closeAll()
--end)

-------------------- Resize -----------------------
hs.hotkey.bind({ "alt" }, "o", nil, actions["Window Maximize"].run)
hs.hotkey.bind({ "alt" }, "f", nil, actions["Window Center"].run)
hs.hotkey.bind({ "alt" }, "k", nil, actions["Window Up"].run)
hs.hotkey.bind({ "alt" }, "j", nil, actions["Window Down"].run)
hs.hotkey.bind({ "alt" }, "h", nil, actions["Window Left"].run)
hs.hotkey.bind({ "alt" }, "l", nil, actions["Window Right"].run)
hs.hotkey.bind({ "alt" }, "d", nil, actions["Window Default"].run)
hs.hotkey.bind({ "alt" }, "u", nil, actions["Window Upper Left"].run)
hs.hotkey.bind({ "alt" }, "i", nil, actions["Window Upper Right"].run)
hs.hotkey.bind({ "alt" }, "n", nil, actions["Window Lower Left"].run)
hs.hotkey.bind({ "alt" }, "m", nil, actions["Window Lower Right"].run)

-- stylua: ignore start
hs.hotkey.bind({ "alt", "ctrl" }, "1", nil,function() actions["FlashSpace Move to 1"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "2", nil,function() actions["FlashSpace Move to 2"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "3", nil,function() actions["FlashSpace Move to 3"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "4", nil,function() actions["FlashSpace Move to 4"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "5", nil,function() actions["FlashSpace Move to 5"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "6", nil,function() actions["FlashSpace Move to 6"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "7", nil,function() actions["FlashSpace Move to 7"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "8", nil,function() actions["FlashSpace Move to 8"].run({ isFocusSpace = false }) end)
hs.hotkey.bind({ "alt", "ctrl" }, "9", nil,function() actions["FlashSpace Move to 9"].run({ isFocusSpace = false }) end)
-- stylua: ignore end
