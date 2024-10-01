#!/bin/bash

CURRENT_WIFI="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"

if [ "$CURRENT_WIFI" = "" ]; then
  sketchybar --set $NAME label="Disconnected" icon=􀙈
else
  sketchybar --set $NAME label="$CURRENT_WIFI" icon=􀙇
fi
