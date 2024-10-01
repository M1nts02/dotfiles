#!/bin/bash

SPACE_ICONS=("􀏧" "􀙌" "􀆿" "􀣳" "􀠖" "􀦈" "􁖎" "􀧹" "􀵱")
sketchybar --add event aerospace_workspace_change
for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid center \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    background.color=0x44ffffff \
    background.corner_radius=2 \
    background.height=20 \
    background.drawing=off \
    label="$sid" \
    label.drawing=off \
    label.font="$FONT:Normal:$FONT_SIZE"  \
    label.padding_left=5 \
    label.padding_right=10 \
    icon=${SPACE_ICONS[$sid - 1]} \
    icon.font="$ICON_FONT:$ICON_FONT_SIZE" \
    icon.drawing=off \
    click_script="aerospace workspace $sid" \
    script="$PLUGIN_DIR/aerospace.sh $sid"
done
