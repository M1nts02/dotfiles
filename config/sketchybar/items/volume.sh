#!/bin/bash

sketchybar \
  --add item volume right \
  --set volume script="$PLUGIN_DIR/volume.sh" \
        label.font="$FONT:Normal:$FONT_SIZE" \
        icon.font="$ICON_FONT:Bold:$ICON_FONT_SIZE"  \
  --subscribe volume volume_change \
