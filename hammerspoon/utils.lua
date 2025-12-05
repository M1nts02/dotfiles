local M = {}

function M.get_dark_mode()
  return hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"
    == "true\n"
end

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

function M.flashSpace_Move_space(spaceId)
  local currentApp = hs.application.frontmostApplication()
  local bundleID = currentApp:bundleID()
  if bundleID == nil then
    return
  end
  hs.execute("flashspace assign-app --name " .. bundleID .. " --workspace 'Space " .. spaceId .. "'", true)
end

return M
