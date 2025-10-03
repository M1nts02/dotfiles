hs.hotkey.bind({ "alt" }, "s", function()
  local abc = "com.apple.keylayout.ABC"
  local rime = "im.rime.inputmethod.Squirrel.Hans"
  local sid = hs.keycodes.currentSourceID()
  if sid == abc then
    hs.keycodes.currentSourceID(rime)
  else
    hs.keycodes.currentSourceID(abc)
  end
end)

-- Switch input method into English
--local sourceID = "com.apple.inputmethod.SCIM.ITABC"
--hs.hotkey.bind("alt", "q", function()
--  local enid = "com.apple.keylayout.ABC"
--  local sid = hs.keycodes.currentSourceID()
--  if sid == enid then
--    hs.keycodes.currentSourceID(sourceID)
--  else
--    sourceID = sid
--    hs.keycodes.currentSourceID(enid)
--  end
--end)
