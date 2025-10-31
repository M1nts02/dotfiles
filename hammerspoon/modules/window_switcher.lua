local wf = hs.window.filter

local function getCurrentAppWindows()
  local activeApp = hs.application.frontmostApplication()
  if not activeApp then
    return nil
  end

  local windows = activeApp:allWindows()

  local filteredWindows = {}
  for _, win in ipairs(windows) do
    if win:isStandard() and not win:isMinimized() then
      table.insert(filteredWindows, win)
    end
  end

  return filteredWindows
end

local function switchTo2AppWindow()
  local windows = getCurrentAppWindows()
  if not windows or #windows <= 1 then
    --hs.alert(string.format("%d window(s) open", windows and #windows or 0))
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
  local windows = getCurrentAppWindows()
  if not windows or #windows <= 1 then
    --hs.alert(string.format("%d window(s) open", windows and #windows or 0))
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
    --hs.alert.closeAll()
  end
end

hs.hotkey.bind("cmd", "`", nil, switchTo2AppWindow)
hs.hotkey.bind({ "alt" }, "`", nil, switchToAllAppWindow)

---------------------------------------------------

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
--

switcher_currentSpace_onScreen = hs.window.switcher.new(wf.new():setCurrentSpace(true), {
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
  switcher_currentSpace_onScreen:next()
  hs.alert.closeAll()
end)
hs.hotkey.bind({ "alt", "shift" }, "tab", "Prev window", function()
  switcher_currentSpace_onScreen:previous()
  hs.alert.closeAll()
end)
