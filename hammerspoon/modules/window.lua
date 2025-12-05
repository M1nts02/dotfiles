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

hs.hotkey.bind({ "cmd" }, "`", nil, switchToAllAppWindow)
