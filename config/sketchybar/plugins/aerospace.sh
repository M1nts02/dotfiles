#!/bin/bash

exist=$(aerospace list-workspaces --monitor all --empty no)
empty=$(aerospace list-workspaces --monitor all --empty)

for eid in $empty; do
  if [ $eid != "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set space.$eid \
      background.drawing=off \
      label.drawing=off \
      icon.drawing=off
  fi
done

for neid in $exist; do
  if [ $neid != "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set space.$neid \
      background.drawing=off \
      label.drawing=on \
      icon.drawing=on
  fi
done

if [ "$1" == "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    background.drawing=on \
    label.drawing=on \
    icon.drawing=on
fi
