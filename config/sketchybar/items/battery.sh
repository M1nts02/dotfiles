#!/bin/bash

sketchybar --add item battery right \
    --set battery \
    update_freq=20 \
    label.font="$FONT:Normal:$FONT_SIZE"  \
    icon.font="$ICON_FONT:$ICON_FONT_SIZE" \
    script="$PLUGIN_DIR/battery.sh"
