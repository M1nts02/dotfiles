local obj = {}
obj.__index = obj

-- Metadata
obj.name = "M1Space"
obj.version = "0.0.1"
obj.author = "M1nts02"
obj.homepage = "https://github.com/M1nts02"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.spaceName = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }

local spaces = {}
local currentSpace
local visibleApps = {}
local hiddenApps = {}

local App = hs.application

local function getPIDsByVisibility()
  local runningApps = App.runningApplications()
  visibleApps = {}
  hiddenApps = {}

  for _, app in ipairs(runningApps) do
    local pid = tostring(app:pid())
    local windows = app:allWindows()
    if #windows > 0 then
      if app:isHidden() then
        hiddenApps[pid] = app
      else
        visibleApps[pid] = app
      end
    end
  end
end

local function getCurrentSpaceApps()
  spaces[currentSpace] = {}
  for pid, _ in pairs(visibleApps) do
    table.insert(spaces[currentSpace], pid)
  end
end

local function getTargetSpaceApps(targetSpaceName)
  local apps = {}
  for _, pid in pairs(spaces[targetSpaceName]) do
    local app = hiddenApps[pid]
    if app ~= nil then
      table.insert(apps, pid)
    end
  end

  spaces[targetSpaceName] = apps
end

function obj.gotoSpace(spaceName)
  if spaceName == currentSpace then
    return
  end
  local space = spaces[spaceName]
  if space == nil then
    hs.notify.new():title("M1Sapce"):subTitle("Space isn't exist"):send()
    return
  end

  getPIDsByVisibility()
  getCurrentSpaceApps()
  getTargetSpaceApps(spaceName)

  local targetSpaceIsEmpty = #spaces[spaceName] == 0

  -- show apps
  for _, v in pairs(spaces[spaceName]) do
    local app = hiddenApps[v]
    if app ~= nil then
      app:unhide()
    end
  end

  -- if target space is empty, focus finder
  if targetSpaceIsEmpty then
    hs.osascript.applescript [[
tell application "Finder"
    activate
end tell
]]
  else -- focus first window
    local pid = tostring(spaces[spaceName][1])
    local app = hiddenApps[pid]
    app:activate(app:allWindows()[1])
  end

  -- if target space is empty, don't hide finder
  spaces[currentSpace] = {}
  for _, app in pairs(visibleApps) do
    if not (targetSpaceIsEmpty and app:bundleID() == "com.apple.finder") then
      app:hide()
      table.insert(spaces[currentSpace], tostring(app:pid()))
    end
  end

  currentSpace = spaceName
end

function obj.sendSpace(spaceName, focus)
  if spaces[spaceName] == nil then
    return
  end

  getPIDsByVisibility()
  local app = App.frontmostApplication()
  local pid = tostring(app:pid())
  local windows = app:allWindows()

  if #visibleApps == 1 then
    hs.osascript.applescript [[
tell application "Finder"
    activate
end tell
]]
  else
    visibleApps[pid] = nil
    for _, a in pairs(visibleApps) do
      a:activate(a:allWindows()[1])
      break
    end
  end

  for i, v in pairs(spaces[currentSpace]) do
    if pid == v then
      spaces[currentSpace][i] = nil
      break
    end
  end

  table.insert(spaces[spaceName], pid)
  if #windows > 0 then
    app:hide()
  end
  if focus == true then
    obj.gotoSpace(spaceName)
  end
end

function obj.init(opt)
  opt = opt or {}
  obj.spaceName = opt.spaceName or obj.spaceName
  for _, v in pairs(obj.spaceName) do
    spaces[v] = {}
  end
  currentSpace = obj.spaceName[1]
end

return obj
