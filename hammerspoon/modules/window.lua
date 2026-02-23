--------------------------- Window ------------------------------
hs.hotkey.bind({ "ctrl", "cmd" }, ",", Actions["Window Left"])
hs.hotkey.bind({ "ctrl", "cmd" }, ".", Actions["Window Right"])
hs.hotkey.bind({ "ctrl", "cmd" }, "o", Actions["Window Maximize"])
hs.hotkey.bind({ "ctrl", "cmd" }, "c", Actions["Window Center"])
hs.hotkey.bind({ "ctrl", "cmd" }, "t", Actions["Window Default"])

-------------------- Window Switcher ----------------------------
-- local wf = hs.window.filter
--
-- local windowFilter = wf.new()
-- windowFilter:setCurrentSpace(true)
--
-- switchWindowsCurrentSpace = hs.window.switcher.new(windowFilter, {
--   showThumbnails = true,
--   thumbnailSize = 256,
--   showSelectedThumbnail = false,
--   onlyActiveApplication = false,
--   showTitles = true,
--   showSelectedTitle = false,
--   textSize = 18,
--   textColor = { 0.9, 0.9, 0.9 },
--   highlightColor = { 0.3, 0.3, 0.3, 0.9 },
--   backgroundColor = { 0.5, 0.5, 0.5, 0.9 },
--   titleBackgroundColor = { 0.5, 0.5, 0.5, 0 },
--   closeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--   minimizeModeBackgroundColor = { 0.5, 0.5, 0.5, 1 },
-- })
--
-- switchWindowsCurrentSpace.getWindows = function()
--   local wins = windowFilter:getWindows()
--   local filteredWins = {}
--   for _, win in ipairs(wins) do
--     if win and not win:isMinimized() then
--       table.insert(filteredWins, win)
--     end
--   end
--   return filteredWins
-- end
--
-- hs.hotkey.bind("cmd", "`", "Next Window", function()
--   switchWindowsCurrentSpace:next()
--   hs.alert.closeAll()
-- end)
-- hs.hotkey.bind({ "cmd", "shift" }, "`", "Prev Window", function()
--   switchWindowsCurrentSpace:previous()
--   hs.alert.closeAll()
-- end)
