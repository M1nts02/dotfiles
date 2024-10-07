#!/bin/bash

dark_mode=$(osascript -e 'tell app "System Events" to tell appearance preferences to get dark mode')

if [ $dark_mode = "true" ]; then
  dir=~/Pictures/壁纸/Light
  /opt/homebrew/bin/sketchybar --set '/.*/' icon.color=0xff000000 label.color=0xff000000
else
  dir=~/Pictures/壁纸/Dark
  /opt/homebrew/bin/sketchybar --set '/.*/' icon.color=0xffffffff label.color=0xffffffff
fi

path=$(ls $dir | /opt/homebrew/bin/gshuf -n 1)

/usr/libexec/PlistBuddy -c "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$dir/$path" ~/Library/Application\ Support/com.apple.wallpaper/Store/Index.plist && killall WallpaperAgent

osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
