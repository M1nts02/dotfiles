#!/bin/bash

dark_mode=$(osascript -e 'tell app "System Events" to tell appearance preferences to get dark mode')

if [ $dark_mode = "true" ]; then
  dir=~/Pictures/Light
else
  dir=~/Pictures/Dark
fi

path=$(ls $dir | /opt/homebrew/bin/gshuf -n 1)

/usr/libexec/PlistBuddy -c "set AllSpacesAndDisplays:Desktop:Content:Choices:0:Files:0:relative file:///$dir/$path" ~/Library/Application\ Support/com.apple.wallpaper/Store/Index.plist && killall WallpaperAgent

osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'
