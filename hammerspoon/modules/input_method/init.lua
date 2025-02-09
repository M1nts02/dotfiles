-- Switch input method into English
local sourceID = "com.apple.inputmethod.SCIM.ITABC"
hs.hotkey.bind("alt", "a", function()
  local enid = "com.apple.keylayout.ABC"
  local sid = hs.keycodes.currentSourceID()
  if sid == enid then
    hs.keycodes.currentSourceID(sourceID)
  else
    sourceID = sid
    hs.keycodes.currentSourceID(enid)
  end
end)

-- Rimer Switcher
hs.hotkey.bind({ "alt" }, "q", function()
  hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
  hs.eventtap.keyStroke({ "control", "shift" }, "f4")
end)

-- require "modules.input_method.auto-switch-input-method"
