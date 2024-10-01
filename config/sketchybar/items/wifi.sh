#!/bin/bash

sketchybar --add item wifi right \
  --set wifi \
    script="$PLUGIN_DIR/wifi.sh" \
    icon.font="$ICON_FONT:Bold:$ICON_FONT_SIZE" \
    label.font="$FONT:Normal:$FONT_SIZE" \
    background.padding_right=12 \
    update_freq=5
