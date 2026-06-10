local M = {}

choose_path = "/opt/homebrew/bin/choose"

---Get a list of audio output devices.
---@return table List of devices, each containing name, current, and device.
function M.get_audio_devices()
  local devices = hs.audiodevice.allOutputDevices()
  local current = hs.audiodevice.defaultOutputDevice()
  local result = {}

  for _, device in ipairs(devices) do
    local name = device:name()
    if name then
      table.insert(result, {
        name = name,
        current = (current and current:name() == name),
        device = device,
      })
    end
  end

  return result
end

---Set the current audio output device.
---@param device_name string|userdata Device name or hs.audiodevice object.
---@return boolean Whether the switch was successful.
function M.set_audio_device(device_name)
  local target = nil

  if type(device_name) == "string" then
    for _, device in ipairs(hs.audiodevice.allOutputDevices()) do
      if device:name() == device_name then
        target = device
        break
      end
    end
  elseif type(device_name) == "userdata" and device_name.setDefaultOutputDevice then
    target = device_name
  end

  if not target then
    return false
  end

  return target:setDefaultOutputDevice()
end

---Interactively switch the audio output device (using choose).
function M.switch_audio_source()
  local devices = M.get_audio_devices()

  if #devices == 0 then
    return
  end

  local choices = {}
  for _, dev in ipairs(devices) do
    table.insert(choices, dev.current and (dev.name .. "  ◀ Current") or dev.name)
  end

  local input = table.concat(choices, "\n")

  local task = hs.task.new(choose_path, function(exitCode, stdOut, stdErr)
    if exitCode ~= 0 or not stdOut or stdOut == "" then
      return
    end

    local selected = stdOut:gsub("%s+$", "")
    -- Remove the current device marker suffix
    local suffix = "  ◀ Current"
    if selected:sub(-#suffix) == suffix then
      selected = selected:sub(1, -#suffix - 1)
    end

    M.set_audio_device(selected)
  end, { "-p", "Select audio output device" })

  task:setInput(input)
  task:start()
end

return M
