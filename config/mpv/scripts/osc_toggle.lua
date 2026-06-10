local utils = require("mp.utils")

-- 默认配置
local default_config = {
    osc_visibility = "never",
    volume = 100,
    fullscreen = false,
    window_maximized = false
}

-- 配置文件路径: mpv配置目录下的 .cache.json
local cache_path = mp.command_native({"expand-path", "~~/.cache.json"})

-- 读取配置文件
local function load_config()
    local file = io.open(cache_path, "r")
    if file then
        local content = file:read("*a")
        file:close()
        local ok, result = pcall(utils.parse_json, content)
        if ok and type(result) == "table" then
            return result
        end
    end
    return nil
end

-- 保存配置文件
local function save_config(config)
    local file, err = io.open(cache_path, "w")
    if file then
        file:write(utils.format_json(config))
        file:close()
    else
        mp.msg.error("无法保存配置到 " .. cache_path .. ": " .. tostring(err))
    end
end

-- 加载配置，若不存在则创建默认配置
local config = load_config()
if not config then
    config = default_config
    save_config(config)
end

-- 确保必要字段存在
if not config.osc_visibility then
    config.osc_visibility = default_config.osc_visibility
end
if not config.volume then
    config.volume = default_config.volume
end
if config.fullscreen == nil then
    config.fullscreen = default_config.fullscreen
end
if config.window_maximized == nil then
    config.window_maximized = default_config.window_maximized
end

local visibility = config.osc_visibility
mp.commandv("script-message", "osc-visibility", visibility)

-- 启动时恢复音量
mp.set_property_number("volume", config.volume)

-- 启动时恢复窗口状态
mp.set_property_bool("fullscreen", config.fullscreen)
if not config.fullscreen then
    mp.set_property_bool("window-maximized", config.window_maximized)
end

mp.register_script_message("cycle-visibility", function()
    if visibility == "never" then
        visibility = "always"
    elseif visibility == "always" then
        visibility = "auto"
    else
        visibility = "never"
    end
    mp.commandv("script-message", "osc-visibility", visibility)

    -- 保存到配置文件
    config.osc_visibility = visibility
    save_config(config)
end)

-- 退出时保存音量和窗口状态
mp.register_event("shutdown", function()
    config.volume = mp.get_property_native("volume")
    config.fullscreen = mp.get_property_native("fullscreen")
    config.window_maximized = mp.get_property_native("window-maximized")
    save_config(config)
end)
