hs.hotkey.bind({ "cmd" }, "space", function()
  local apps =
    hs.execute "/bin/ls /Applications/ /Applications/Utilities/ /System/Applications/ /System/Applications/Utilities/ |  grep '\\.app$' | sed 's/\\.app$/.app/g'"

  for k, _ in pairs(Actions) do
    apps = apps .. k .. "\n"
  end

  local result = hs.execute('source ~/.zshrc; echo "' .. apps .. '" | choose')
  if string.sub(result, -4) == ".app" then
    hs.application.launchOrFocus(result)
  else
    Actions[result]()
  end
end)
