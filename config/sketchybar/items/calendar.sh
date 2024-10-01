#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Normal:$FONT_SIZE"
  icon.padding_right=0
  label.width=45
  label.align=right
  label.font="$FONT:Normal:$FONT_SIZE"
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar left \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
