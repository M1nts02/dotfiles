local application = require "hs.application"
local hotkey = require "hs.hotkey"
local actions = require "actions"

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

local function getItems()
  local currentTime = os.time()
  if
    applicationsCache
    and applicationsCacheTime
    and (currentTime - applicationsCacheTime) < applicationsCacheDuration
  then
    return applicationsCache
  end

  local items = {}
  local appPaths = {
    "/Applications/",
    "~/Applications/",
    "/System/Applications/",
    "/System/Applications/Utilities/",
    "/System/Cryptexes/App/System/Applications",
  }

  for _, path in ipairs(appPaths) do
    local expandedPath = os.getenv "HOME" and path:gsub("^~", os.getenv "HOME") or path
    local command = "find " .. expandedPath .. " -name '*.app' -type d -maxdepth 2 2>/dev/null | sort"
    local handle = io.popen(command)
    if handle then
      for line in handle:lines() do
        local appName = line:match "([^/]+)%.app$"
        if appName then
          table.insert(items, { name = appName, path = line })
        end
      end
      handle:close()
    end
  end

  applicationsCache = items
  applicationsCacheTime = currentTime

  return items
end

local function launchItem(item)
  if not item then
    return
  end

  if item.type == "App" then
    application.launchOrFocus(item.path)
  elseif item.type == "Action" then
    actions[item.name]()
  end

  if chooser then
    chooser:hide()
  end
end

chooser = hs.chooser.new(function(selection)
  if selection then
    launchItem(selection)
  end
end)

chooser:rows(config.maxResults)
chooser:searchSubText(false)

local function searchItems(query)
  if not query or query == "" then
    chooser:choices {}
    return
  end

  local allItems = getItems()
  local filteredItems = {}

  for _, item in ipairs(allItems) do
    if config.matcher(item.name, query) then
      local appInfo = {
        text = item.name,
        subText = item.path,
        name = item.name,
        path = item.path,
        type = "App",
      }
      table.insert(filteredItems, appInfo)

      if #filteredItems >= config.maxResults then
        break
      end
    end
  end

  for i, _ in pairs(actions) do
    table.insert(filteredItems, { text = i, subText = "Action", name = i, type = "Action" })
  end

  chooser:choices(filteredItems)
end

chooser:queryChangedCallback(function(query)
  if searchTimer then
    searchTimer:stop()
  end

  searchTimer = hs.timer.doAfter(config.debounceDelay / 1000, function()
    searchItems(query)
  end)
end)

hotkey.bind({ "cmd" }, "space", function()
  chooser:bgDark(
    hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'" == "true\n"
  )

  chooser:show()
  chooser:query ""
end)
