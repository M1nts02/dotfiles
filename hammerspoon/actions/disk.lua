local M = {}

local choose_path = "/opt/homebrew/bin/choose"

function M.get_external_volumes()
  local volumes = {}
  local output = hs.execute("diskutil list -plist | plutil -convert json -r -o - -- - 2>/dev/null", true)

  if not output or output == "" then
    return volumes
  end

  local ok, data = pcall(hs.json.decode, output)
  if not ok or not data or not data.AllDisksAndPartitions then
    return volumes
  end

  for _, disk in ipairs(data.AllDisksAndPartitions) do
    if disk.OSInternal == false and disk.Partitions then
      for _, part in ipairs(disk.Partitions) do
        local name = part.VolumeName or ""
        if name ~= "" and name ~= "EFI" and part.Content ~= "Not applicable (no file system)" then
          table.insert(volumes, {
            part = part.DeviceIdentifier,
            name = name,
            mounted = part.MountPoint ~= nil,
          })
        end
      end
    end
  end

  return volumes
end

function M.show_disk_menu()
  local volumes = M.get_external_volumes()

  if #volumes == 0 then
    hs.notify.show("Disk", "No external volumes found", "")
    return
  end

  local choices = {}
  local lookup = {}
  for _, vol in ipairs(volumes) do
    local text = vol.name .. " [" .. (vol.mounted and "mounted" or "unmounted") .. "]"
    table.insert(choices, text)
    lookup[text] = vol
  end

  local input = table.concat(choices, "\n")

  local task = hs.task.new(choose_path, function(exitCode, stdOut, stdErr)
    if exitCode ~= 0 or not stdOut or stdOut == "" then
      return
    end

    local selected = stdOut:gsub("%s+$", "")
    local vol = lookup[selected]
    if not vol then
      return
    end

    if vol.mounted then
      hs.execute("diskutil eject /dev/" .. vol.part)
      hs.notify.show("Disk", "Ejected " .. vol.name, "")
    else
      hs.execute("diskutil mount /dev/" .. vol.part)
      hs.notify.show("Disk", "Mounted " .. vol.name, "")
    end
  end, { "-p", "Select volume to mount/eject" })

  task:setInput(input)
  task:start()
end

return M
