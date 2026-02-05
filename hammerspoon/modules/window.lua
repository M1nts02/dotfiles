--------------------------- Window ------------------------------
hs.hotkey.bind({ "ctrl", "cmd" }, ",", Actions["Window Left"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, ".", Actions["Window Right"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, "o", Actions["Window Maximize"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, "c", Actions["Window Center"].run)
hs.hotkey.bind({ "ctrl", "cmd" }, "t", Actions["Window Default"].run)

-------------------- Windows Switcher ---------------------------
--local function getCurrentAppWindows()
--  local activeApp = hs.application.frontmostApplication()
--  if not activeApp then
--    return nil
--  end
--
--  local windows = activeApp:allWindows()
--
--  local filteredWindows = {}
--  for _, win in ipairs(windows) do
--    if win:isStandard() and not win:isMinimized() then
--      table.insert(filteredWindows, win)
--    end
--  end
--
--  return filteredWindows
--end

local function getAllActiveWindows()
  local apps = hs.application.runningApplications()
  local filteredWindows = {}

  for _, app in ipairs(apps) do
    if app:isRunning() then
      local windows = app:allWindows()
      for _, win in ipairs(windows) do
        if win:isStandard() and not win:isMinimized() and win:isVisible() then
          table.insert(filteredWindows, win)
        end
      end
    end
  end

  return filteredWindows
end

local function switchTo2AppWindow()
  -- local windows = getCurrentAppWindows()
  -- if not windows or #windows <= 1 then
  --   --hs.alert(string.format("%d window(s) open", windows and #windows or 0))
  --   return
  -- end
  local windows = getAllActiveWindows()
  if not windows or #windows <= 1 then
    return
  end

  local focusedWindow = hs.window.frontmostWindow()
  local focusedIndex = 1

  for i, win in ipairs(windows) do
    if win == focusedWindow then
      focusedIndex = i
      break
    end
  end

  local nextIndex = focusedIndex % #windows + 1

  local nextWindow = windows[nextIndex]
  if nextWindow then
    nextWindow:focus {
      unhide = true,
      focus = true,
    }
    --hs.alert.closeAll()
  end
end

local function switchToAllAppWindow()
  local windows = getAllActiveWindows()
  if not windows or #windows <= 1 then
    return
  end

  local focusedWindow = hs.window.frontmostWindow()
  local focusedIndex = 1

  for i, win in ipairs(windows) do
    if win == focusedWindow then
      focusedIndex = i
      break
    end
  end

  local prevIndex = focusedIndex - 1
  if prevIndex < 1 then
    prevIndex = #windows
  end

  local prevWindow = windows[prevIndex]
  if prevWindow then
    prevWindow:focus {
      unhide = true,
      focus = true,
    }
  end
end

hs.hotkey.bind("cmd", "`", nil, switchTo2AppWindow)
hs.hotkey.bind("cmd", "escape", nil, switchToAllAppWindow)

-------------------- Window Switcher ----------------------------
-- local wf = hs.window.filter
--
-- local windowFilter = wf.new()
-- windowFilter:setCurrentSpace(true)
--
-- switchWindowsCurrentSpace = hs.window.switcher.new(windowFilter, {
--   showThumbnails = false,
--   showSelectedThumbnail = true,
--   onlyActiveApplication = false,
--   textColor = { 0.9, 0.9, 0.9 },
--   highlightColor = { 0.3, 0.3, 0.3, 1 },
--   backgroundColor = { 0.5, 0.5, 0.5, 1 },
--   showTitles = false,
--   titleBackgroundColor = { 0.5, 0.5, 0.5, 1 },
--   showSelectedTitle = true,
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
-- hs.hotkey.bind("alt", "tab", "Next window", function()
--   switchWindowsCurrentSpace:next()
--   hs.alert.closeAll()
-- end)
-- hs.hotkey.bind({ "alt", "shift" }, "tab", "Prev window", function()
--   switchWindowsCurrentSpace:previous()
--   hs.alert.closeAll()
-- end)
