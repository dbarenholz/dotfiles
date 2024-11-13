#!/bin/sh
xrandr \
  --output eDP-1 --primary --mode 1920x1080 --pos 0x360 --rotate normal \
  --output HDMI-1-0 --mode 2560x1440 --pos 1920x0 --rotate normal \
  --output DP-1-0 --off \
  --output DP-1-1 --off
