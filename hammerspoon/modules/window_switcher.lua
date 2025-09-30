local wf = hs.window.filter

--switcher_currentAllSpace = hs.window.switcher.new(wf.new():setCurrentSpace(true):setDefaultFilter {}, {
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
--  switcher_currentAllSpace:next()
--  hs.alert.closeAll()
--end)
--hs.hotkey.bind({ "alt", "shift" }, "tab", "Prev window", function()
--  switcher_currentAllSpace:previous()
--  hs.alert.closeAll()
--end)

switcher_currentSpace_onScreen = hs.window.switcher.new(wf.new():setCurrentSpace(true), {
  showThumbnails = false,
  showSelectedThumbnail = false,
  onlyActiveApplication = true,
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
