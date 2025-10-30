local application = require "hs.application"
local hotkey = require "hs.hotkey"

local config = {
  debounceDelay = 100,
  matcher = function(appName, query) -- Case insensitive
    return appName:lower():match(query:lower())
  end,
  maxResults = 9,
}

local chooser = nil
local applicationsCache = nil
local applicationsCacheTime = nil
local applicationsCacheDuration = 3600
local searchTimer = nil

local function getApplications()
  local currentTime = os.time()
  if
    applicationsCache
    and applicationsCacheTime
    and (currentTime - applicationsCacheTime) < applicationsCacheDuration
  then
    return applicationsCache
  end

  local apps = {}
  local appPaths = {
    "/Applications/",
    "~/Applications/",
    "/System/Applications/",
    "/System/Applications/Utilities/",
  }

  for _, path in ipairs(appPaths) do
    local expandedPath = os.getenv "HOME" and path:gsub("^~", os.getenv "HOME") or path
    local command = "find " .. expandedPath .. " -name '*.app' -type d -maxdepth 2 2>/dev/null | sort"
    local handle = io.popen(command)
    if handle then
      for line in handle:lines() do
        local appName = line:match "([^/]+)%.app$"
        if appName then
          table.insert(apps, { name = appName, path = line })
        end
      end
      handle:close()
    end
  end

  applicationsCache = apps
  applicationsCacheTime = currentTime

  return apps
end

local function launchApplication(app)
  if not app then
    return
  end

  local runningApps = application.runningApplications()
  local appRunning = false

  for _, runningApp in ipairs(runningApps) do
    if runningApp:name() == app.name or runningApp:path() == app.path then
      runningApp:activate()
      appRunning = true
      break
    end
  end

  if not appRunning then
    application.launchOrFocus(app.path)
  end

  if chooser then
    chooser:hide()
  end
end

chooser = hs.chooser.new(function(selection)
  if selection then
    launchApplication(selection)
  end
end)

chooser:rows(config.maxResults)
chooser:searchSubText(false)

local function searchApplications(query)
  if not query or query == "" then
    chooser:choices {}
    return
  end

  local allApps = getApplications()
  local filteredApps = {}

  for _, app in ipairs(allApps) do
    if config.matcher(app.name, query) then
      local appInfo = {
        text = app.name,
        subText = app.path,
        name = app.name,
        path = app.path,
      }
      table.insert(filteredApps, appInfo)

      if #filteredApps >= config.maxResults then
        break
      end
    end
  end

  chooser:choices(filteredApps)
end

chooser:queryChangedCallback(function(query)
  if searchTimer then
    searchTimer:stop()
  end

  searchTimer = hs.timer.doAfter(config.debounceDelay / 1000, function()
    searchApplications(query)
  end)
end)

hotkey.bind({ "cmd" }, "space", function()
  chooser:bgDark(
    hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'" == "true\n"
  )

  chooser:show()
  chooser:query ""
end)
