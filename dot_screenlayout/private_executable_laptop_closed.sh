#!/bin/sh
xrandr \
  --output eDP-1 --off \
  --output HDMI-1-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal \
  --output DP-1-0 --off \
  --output DP-1-1 --off
