-- app to expected ime config
local app2Ime = {
  { "/Applications/QQ.app", "Rime" },
  { "/Applications/Pages.app", "Rime" },
  { "/Applications/Thorium.app", "Rime" },
  { "/Applications/Alacritty.app", "English" },
  { "/Applications/Ghostty.app", "English" },
  { "/System/Applications/App Store.app", "Rime" },
  { "/System/Applications/Notes.app", "Rime" },
}

function updateFocusAppInputMethod(appObject)
  local ime = "English"
  local focusAppPath = appObject:path()
  for index, app in pairs(app2Ime) do
    local appPath = app[1]
    local expectedIme = app[2]

    if focusAppPath == appPath then
      ime = expectedIme
      break
    end
  end

  if ime == "English" then
    local enid = "com.apple.keylayout.ABC"
    local sid = hs.keycodes.currentSourceID()
    if enid ~= sid then
      hs.keycodes.currentSourceID "com.apple.keylayout.ABC"
    end
  elseif ime == "Rime" then
    local rmid = "im.rime.inputmethod.Squirrel.Hans"
    local sid = hs.keycodes.currentSourceID()
    if rmid ~= sid then
      hs.keycodes.currentSourceID(rmid)
    end
  elseif ime == "Chinese" then
    local cnid = "com.apple.inputmethod.SCIM.ITABC"
    local sid = hs.keycodes.currentSourceID()
    if cnid ~= sid then
      hs.keycodes.currentSourceID(cnid)
    end
  end
end

-- Handle cursor focus and application's screen manage.
function applicationWatcher(appName, eventType, appObject)
  if eventType == hs.application.watcher.activated then
    updateFocusAppInputMethod(appObject)
  end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
