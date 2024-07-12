-- video mode

function on_video_mode_activate()
  mp.set_property("osd-playing-msg", "${media-title}") -- in video mode use media-title
  mp.commandv("set", "options/osd-bar", "yes")
end

function on_video_mode_deactivate() end

-- audio mode

function on_audio_mode_activate()
  mp.set_property("osd-playing-msg", "${media-title}") -- in audio mode use media-title
  mp.commandv("set", "options/osd-bar", "yes")
end

function on_audio_mode_deactivate() end

-- image mode

function on_image_mode_activate()
  mp.set_property("osd-playing-msg", "") -- disable osd-playing-msg for images
  mp.commandv("set", "options/osd-bar", "no")
end

function on_image_mode_deactivate() end

-- called whenever the file extension changes

function on_type_change(old_ext, new_ext)
  if new_ext == ".gif" then
    mp.set_property("loop-file", "inf") -- loop GIF files
  end

  if old_ext == ".gif" then
    mp.set_property("loop-file", "no") -- use loop-file=no for anything except GIF
  end
end

-- extension configuration
image_file_extensions = { ".jpg", ".png", ".bmp", ".gif", ".webp" }
audio_file_extensions = {
  ".mp3",
  ".ogg",
  ".opus",
  ".flac",
  ".m4a",
  ".mka",
  ".ac3",
  ".dts",
  ".dtshd",
  ".dtshr",
  ".dtsma",
  ".eac3",
  ".mp2",
  ".mpa",
  ".thd",
  ".w64",
  ".wav",
  ".aac",
}

----- string
function ends_with(value, ending)
  return ending == "" or value:sub(-#ending) == ending
end

----- path

function get_file_ext(path)
  if path == nil then
    return nil
  end
  local val = path:match "^.+(%.[^%./\\]+)$"
  if val == nil then
    return nil
  end
  return val:lower()
end

----- list

function list_contains(list, value)
  for _, v in pairs(list) do
    if v == value then
      return true
    end
  end

  return false
end

----- main

active_mode = "video"
last_type = nil

function enable_video_mode()
  if active_mode == "video" then
    return
  end
  active_mode = "video"
  on_video_mode_activate()
end

function enable_audio_mode()
  if active_mode == "audio" then
    return
  end
  active_mode = "audio"
  on_audio_mode_activate()
end

function enable_image_mode()
  if active_mode == "image" then
    return
  end
  active_mode = "image"
  on_image_mode_activate()
end

function disable_video_mode()
  if active_mode ~= "video" then
    return
  end
  active_mode = ""
  on_video_mode_deactivate()
end

function disable_image_mode()
  if active_mode ~= "image" then
    return
  end
  active_mode = ""
  on_image_mode_deactivate()
end

function disable_audio_mode()
  if active_mode ~= "audio" then
    return
  end
  active_mode = ""
  on_audio_mode_deactivate()
end

function on_start_file(event)
  local ext = get_file_ext(mp.get_property "path")

  if list_contains(image_file_extensions, ext) then
    disable_video_mode()
    disable_audio_mode()
    enable_image_mode()
  elseif list_contains(audio_file_extensions, ext) then
    disable_image_mode()
    disable_video_mode()
    enable_audio_mode()
  else
    disable_audio_mode()
    disable_image_mode()
    enable_video_mode()
  end

  if last_type ~= ext then
    on_type_change(last_type, ext)
    last_type = ext
  end
end

mp.register_event("start-file", on_start_file)
