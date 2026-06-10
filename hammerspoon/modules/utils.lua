local M = {}

---@return boolean
function M.get_dark_mode()
  local result = hs.execute "defaults read -g AppleInterfaceStyle 2>/dev/null"
  return result:match "^Dark%s*$" ~= nil
end

---@return table
function M.get_helper_color()
  if M.get_dark_mode() then
    return { strokeColor = { white = 0.05, alpha = 1 }, fillColor = { white = 0.05, alpha = 1 }, textColor = { white = 0.5, alpha = 1 } }
  else
    return { strokeColor = { white = 0.95, alpha = 1 }, fillColor = { white = 0.95, alpha = 1 }, textColor = { white = 0.5, alpha = 1 } }
  end
end

---@param app string
---@return string
function M.getBundleId(app)
  return hs.execute("echo -n $(osascript -e 'id of app \"" .. app .. "\"')", true)
end

---@param opt table
function M.ScreenShot(opt)
  opt.dir = opt.dir ~= nil and opt.dir or os.getenv "HOME" .. "/Pictures/"
  opt.fileName = opt.fileName ~= nil and opt.fileName or ("ss-" .. string.gsub(os.date "%Y-%m-%d_%T", ":", ".") .. ".png")
  local fileFullPath = opt.dir .. opt.fileName

  if opt.mode == "Clipboard" then
    hs.task.new("/usr/sbin/screencapture", nil, { "-cio", fileFullPath }):start()
  elseif opt.mode == "Screen" then
    hs.task.new("/usr/sbin/screencapture", nil, { fileFullPath }):start()
  elseif opt.mode == "Area" then
    hs.task.new("/usr/sbin/screencapture", nil, { "-io", fileFullPath }):start()
  elseif opt.mode == "App" then
    hs.task.new("/usr/sbin/screencapture", nil, { "-l" .. hs.window.frontmostWindow():id(), fileFullPath }):start()
  else
    return
  end

  if opt.notify == true then
    hs.notify.new():title("Screenshot"):subTitle(fileFullPath):send()
  elseif type(opt.notify) == "string" then
    hs.notify.new():title("Screenshot"):subTitle(opt.notify):send()
  end
end

---@param cmd string
function M.sudoExecute(cmd)
  local appleScript = string.format([[do shell script "%s" with administrator privileges]], cmd:gsub('"', '\\"'))

  local ok, result = hs.osascript.applescript(appleScript)
  if ok then
    return result
  else
    hs.notify.show("Sudo fail", "", tostring(result))
    return nil, result
  end
end

---@param key string
function M.MediaKeyEvent(key)
  hs.eventtap.event.newSystemKeyEvent(key, true):post()
  hs.eventtap.event.newSystemKeyEvent(key, false):post()
end

function M.rime_switcher()
  local rimeID = "im.rime.inputmethod.Squirrel.Hans"
  local currentID = hs.keycodes.currentSourceID()
  if currentID ~= rimeID then
    hs.keycodes.currentSourceID(rimeID)
    hs.timer.doAfter(0.15, function()
      hs.eventtap.keyStroke({ "ctrl", "shift" }, "f4")
    end)
  else
    hs.eventtap.keyStroke({ "ctrl", "shift" }, "f4")
  end
end

return M
