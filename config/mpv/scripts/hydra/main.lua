local set = require("hydra").set

mp.register_script_message("hydra-leader", function()
  set {
    ["l"] = { "ab-loop", "ab-loop" },

    -- Window
    ["w"] = {
      "Window",
      {
        ["q"] = { "Quit", "quit" },
        ["Q"] = { "Quit-later", "quit-watch-later" },
        ["f"] = { "Fullscreen", "cycle fullscreen", keep = true },
        ["t"] = { "ontop", "cycle ontop", keep = true },
      },
    },

    -- Play
    ["p"] = {
      "Play",
      {
        ["s"] = {
          "Speed",
          {
            ["-"] = { "Subtract", "add speed -0.1", keep = true },
            ["="] = { "Add", "add speed 0.1", keep = true },
            ["0"] = { "Reset", "set speed 1.0", keep = true },
          },
        },
        ["c"] = {
          "Contrast",
          {
            ["-"] = { "Subtract", "add contrast -0.5", keep = true },
            ["="] = { "Add", "add contrast 0.5", keep = true },
            ["0"] = { "Reset", "set contrast 0", keep = true },
          },
        },
        ["b"] = {
          "Brightness",
          {
            ["-"] = { "Subtract", "add brightness -0.5", keep = true },
            ["="] = { "Add", "add brightness 0.5", keep = true },
            ["0"] = { "Reset", "set brightness 0", keep = true },
          },
        },
        ["g"] = {
          "Gamma",
          {
            ["-"] = { "Subtract", "add gamma -0.5", keep = true },
            ["="] = { "Add", "add gamma 0.5", keep = true },
            ["0"] = { "Reset", "set gamma 0", keep = true },
          },
        },
        ["a"] = {
          "Saturation",
          {
            ["-"] = { "Subtract", "add saturation -0.5", keep = true },
            ["="] = { "Add", "add saturation 0.5", keep = true },
            ["0"] = { "Reset", "set saturation 0", keep = true },
          },
        },
        ["h"] = {
          "Hue",
          {
            ["-"] = { "Subtract", "add hue -0.5", keep = true },
            ["="] = { "Add", "add hue 0.5", keep = true },
            ["0"] = { "Reset", "set hue 0", keep = true },
          },
        },
      },
    },

    -- Video
    ["v"] = {
      "Video",
      {
        ["r"] = { "Rotate", 'cycle-values video-rotate "0" "90" "180" "270"', keep = true },
        ["s"] = {
          "Scale",
          {
            ["-"] = { "Subtract", "add current-window-scale -0.1", keep = true },
            ["="] = { "Add", "add current-window-scale 0.1", keep = true },
            ["0"] = { "Reset", "set current-window-scale 1.0", keep = true },
          },
        },
        ["p"] = { "Panscan", 'cycle-values panscan "0.0" "1.0"', keep = true },
        ["z"] = {
          "Zoom",
          {
            ["-"] = { "Subtract", "add video-zoom -0.1", keep = true },
            ["="] = { "Add", "add video-zoom 0.1", keep = true },
            ["0"] = { "Reset", "set video-zoom 0", keep = true },
          },
        },
        ["x"] = {
          "Pan-x",
          {
            ["-"] = { "Subtract", "add video-pan-x -0.1", keep = true },
            ["="] = { "Add", "add video-pan-x 0.1", keep = true },
            ["0"] = { "Reset", "set video-pan-x 0", keep = true },
          },
        },
        ["y"] = {
          "Pan-y",
          {
            ["-"] = { "Subtract", "add video-pan-y -0.1", keep = true },
            ["="] = { "Add", "add video-pan-y 0.1", keep = true },
            ["0"] = { "Reset", "set video-pan-y 0", keep = true },
          },
        },
        ["o"] = { "Reset", "set video-zoom 0 ; set video-pan-x 0 ; set video-pan-y 0", keep = true },
      },
    },
  }
end)
