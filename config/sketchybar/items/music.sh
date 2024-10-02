#!/bin/bash

sketchybar \
  --add item music left \
  --set music \
    script="$PLUGIN_DIR/music.sh" \
    popup.align=center \
    padding_left=0 \
    drawing=off \
    label="Loading…" \
    label.font="$FONT:Bold:$FONT_SIZE" \
    background.image=media.artwork \
    background.image.scale=0.75 \
    icon.padding_left=20 \
    icon.font="ICON_$FONT:Bold:$ICON_FONT_SIZE"  \
    label.max_chars=38 \
    updates=on \
  --subscribe music media_change