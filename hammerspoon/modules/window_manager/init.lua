local Apps = {
  ["Alacritty"] = "Max",
  ["Blender"] = "Max",
  ["Brave Browser"] = "Max",
  ["Rio"] = "Max",
  ["Safari浏览器"] = "Max",
  ["WezTerm"] = "Max",
  ["WPS Office"] = "Max",
  ["QQ"] = "Float",
  ["Zen Browser"] = "Max",
}

applicationWatcher = hs.application.watcher.new(function(appName, eventType, appObject)
  if eventType == hs.application.watcher.launched then
    if Apps[appName] == "Max" then
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
    elseif Apps[appName] == "Float" then
      hs.window.focusedWindow():moveToUnit { 0.075, 0.075, 0.85, 0.85 }
    elseif Apps[appName] "Up" then
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.4925 }
    elseif Apps[appName] "Down" then
      hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.99, 0.4925 }
    elseif Apps[appName] "Left" then
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }
    elseif Apps[appName] "Right" then
      hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }
    elseif Apps[appName] "Top" then
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.93 }
    end
  end
end)

applicationWatcher:start()
