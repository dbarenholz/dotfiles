#!/bin/bash

# Check if running under wayland.
if [[ "$WAYLAND_DISPLAY" = "" ]]; then
  notify-send --urgency "critical"\
    "No wayland session"\
    "Color picker must be run under a valid wayland session."
  exit 1
fi

# Check if slurp is installed
if ! command -v slurp &> /dev/null; then
  notify-send --urgency "critical"\
    "Slurp not available"\
    "Color picker requires slurp to work. Install it, or check your PATH."
  exit 1
fi

# Check if grim is installed
if ! command -v grim &> /dev/null; then
  notify-send --urgency "critical"\
    "Grim not available"\
    "Color picker requires grim to work. Install it, or check your PATH."
  exit 1
fi


# Get color position
position="$(slurp -b 00000000 -p)"

# Prevent issues with grim always returning improper color.
sleep 1

# Extract the color
color="$(grim -g "$position" -t png -\
    | convert - -format '%[pixel:p{0,0}]' txt:-\
    | tail -n 1\
    | cut -d ' ' -f 4
)"

notify-send --urgency "normal" "color-picker.sh" "$color"
echo "$color (copied to clipboard)"
echo "$color" | wl-copy -n
