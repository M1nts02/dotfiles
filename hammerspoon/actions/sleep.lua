local M = {}

function M.get_sleep_disabled()
  local output = hs.execute("pmset -g | grep SleepDisabled", true)
  output = output:gsub("%s+", "")
  return output:sub(-1) == "1"
end

function M.toggle_sleep_disabled()
  local current = M.get_sleep_disabled()
  local new_val = current and "0" or "1"
  Utils.sudoExecute("pmset -a disablesleep " .. new_val)
end

return M
