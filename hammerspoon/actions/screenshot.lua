local M = {}
local dir = os.getenv "HOME" .. "/Pictures/"

---@param mode string
function M.ScreenShot(mode)
  local fileFullPath = dir .. ("ss-" .. string.gsub(os.date "%Y-%m-%d_%T", ":", ".") .. ".png")
  local args = {}

  if mode == "Clipboard" then
    args = { "-cio", fileFullPath }
  elseif mode == "Screen" then
    args = { fileFullPath }
  elseif mode == "Area" then
    args = { "-io", fileFullPath }
  elseif mode == "App" then
    args = { "-l" .. hs.window.frontmostWindow():id(), fileFullPath }
  else
    return
  end

  hs.task
    .new("/usr/sbin/screencapture", function(exitCode, stdOut, stdErr)
      if exitCode == 0 then
        hs.notify
          .new(function(notification)
            hs.task.new("/usr/bin/open", nil, { "-R", fileFullPath }):start()
          end)
          :title("Screenshot")
          :subTitle(fileFullPath)
          :send()
        print("Output: " .. stdOut)
      else
        hs.notify.new():title("Screenshot"):subTitle("Screenshot failed"):send()
        print("Error Code: " .. exitCode)
        print("Error Output: " .. stdErr)
      end
    end, args)
    :start()
end

return M
