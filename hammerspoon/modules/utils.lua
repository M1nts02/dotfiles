local M = {}

---@return boolean
function M.get_dark_mode()
  return hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"
    == "true\n"
end

---@return table
function M.get_helper_color()
  if M.get_dark_mode() then
    return {
      strokeColor = { white = 0.05, alpha = 1 },
      fillColor = { white = 0.05, alpha = 1 },
      textColor = { white = 0.5, alpha = 1 },
    }
  else
    return {
      strokeColor = { white = 0.95, alpha = 1 },
      fillColor = { white = 0.95, alpha = 1 },
      textColor = { white = 0.5, alpha = 1 },
    }
  end
end

---@param app string
---@return string
function M.getBundleId(app)
  return hs.execute("echo -n $(osascript -e 'id of app \"" .. app .. "\"')", true)
end

---@param opt table
function M.ScreenShot(opt)
  if type(opt) ~= "table" then
    return
  end

  local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")

  opt.dir = opt.dir ~= nil and opt.dir or os.getenv "HOME" .. "/Pictures/"
  opt.fileName = opt.fileName ~= nil and opt.fileName or "ss-" .. timeStamp .. ".png"
  local fileFullPath = opt.dir .. opt.fileName

  if opt.mode == "Clipboard" then
    hs.task.new("/usr/sbin/screencapture", nil, { "-cio", fileFullPath }):start()
  elseif opt.mode == "Screen" then
    hs.task.new("/usr/sbin/screencapture", nil, { fileFullPath }):start()
  elseif opt.mode == "Area" then
    hs.task.new("/usr/sbin/screencapture", nil, { "-io", fileFullPath }):start()
  elseif opt.mode == "App" then
    local windowId = hs.window.frontmostWindow():id()
    hs.task.new("/usr/sbin/screencapture", nil, { "-l" .. windowId, fileFullPath }):start()
  else
    return
  end

  if opt.notify == true then
    hs.notify.new():title("Screenshot"):subTitle(fileFullPath):send()
  elseif type(opt.notify) == "string" then
    hs.notify.new():title("Screenshot"):subTitle(opt.notify):send()
  end
end

return M
