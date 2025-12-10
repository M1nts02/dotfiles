local obj = {}

-- Metadata
obj.name = "Launcher"
obj.version = "0.0.1"
obj.author = "M1nts02"
obj.homepage = "https://github.com/M1nts02"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.debounceDelay = 100
obj.maxResults = 9
obj.preAction = function(item) end
obj.postAction = function(item) end
obj.bgDark = true
obj.appPaths = {
  "/Applications/",
  "~/Applications/",
  "/System/Applications/",
  "/System/Applications/Utilities/",
  "/System/Cryptexes/App/System/Applications/",
}
obj.actions = {}

local application = require "hs.application"

local function matcher(appName, query) -- Case insensitive
  return appName:lower():match(query:lower())
end

local chooser = nil
local searchTimer = nil
local items = {}

local function launchItem(item)
  if not item then
    return
  end

  if type(obj.preAction) == "function" then
    obj.preAction(item)
  end

  if item.type == "App" then
    application.launchOrFocus(item.path)
  elseif item.type == "Action" then
    obj.preAction(item)
    obj.actions[item.name].run()
  end

  if type(obj.postAction) == "function" then
    obj.postAction(item)
  end
end

chooser = hs.chooser.new(function(selection)
  if selection then
    if chooser then
      chooser:hide()
    end

    launchItem(selection)
  end
end)

chooser:rows(obj.maxResults)
chooser:searchSubText(false)

local function searchItems(query)
  if not query or query == "" then
    chooser:choices {}
    return
  end

  local filteredItems = {}

  for _, item in ipairs(items) do
    if matcher(item.name, query) then
      if item.path ~= nil then
        table.insert(filteredItems, {
          text = item.name,
          subText = item.path,
          name = item.name,
          path = item.path,
          image = item.image,
          type = "App",
        })
      else
        table.insert(filteredItems, {
          text = item.name,
          subText = actions[item.name].subText ~= nil and actions[item.name].subText or "Action: " .. item.name,
          name = item.name,
          image = actions[item.name].image,
          type = "Action",
        })
      end

      if #filteredItems >= obj.maxResults then
        break
      end
    end
  end

  chooser:choices(filteredItems)
end

chooser:queryChangedCallback(function(query)
  if searchTimer then
    searchTimer:stop()
  end

  searchTimer = hs.timer.doAfter(obj.debounceDelay / 1000, function()
    searchItems(query)
  end)
end)

function obj.start()
  local applications = {} -- Remove duplicates
  for _, path in ipairs(obj.appPaths) do
    local expandedPath = os.getenv "HOME" and path:gsub("^~", os.getenv "HOME") or path
    local command = "find " .. expandedPath .. " -name '*.app' -type d -maxdepth 2 2>/dev/null | sort"
    local handle = io.popen(command)
    if handle then
      for line in handle:lines() do
        local appName = line:match "([^/]+)%.app$"
        if appName then
          applications[appName] = { name = appName, path = line }
        end
      end
      handle:close()
    end
  end

  for _, v in pairs(applications) do
    local bundleID = hs.execute("echo -n $(osascript -e 'id of app \"" .. v.path .. "\"')", true)
    v.image = bundleID and hs.image.imageFromAppBundle(bundleID) or nil
    table.insert(items, v)
  end

  for actionName, _ in pairs(obj.actions) do
    table.insert(items, { name = actionName })
  end
end

function obj.open()
  chooser:bgDark(obj.bgDark)
  chooser:show()
  chooser:query ""
end

return obj
