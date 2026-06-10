local M = {}

function M.switch_group(index)
  return hs.execute("minttab switch-group " .. index, true)
end

function M.assign_group(index)
  return hs.execute("minttab assign-group " .. index, true)
end

return M
