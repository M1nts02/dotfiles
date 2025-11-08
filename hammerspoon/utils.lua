local M = {}

function M.get_helper_color()
  local output = hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"

  if output == "true\n" then
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

return M
