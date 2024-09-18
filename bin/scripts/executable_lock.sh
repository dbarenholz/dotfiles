#!/usr/bin/env bash

# Disallow running when inside a container
[ -n "$CONTAINER_ID" ] &&
  notify-send --urgency "critical" "lock.sh" "Attempted to run from distrobox. Don't." &&
  exit 1

## Locking script that sets a blurred lockscreen with optional text
# Uses grim, swaylock and imagemagick.
# Usage:
#   lock.sh        --> locks the screen with a blurred image
#   lock.sh "text" --> locks the screen with a blurred image, with text on top

IMG="$HOME/tmp/swaylock.img"

grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" "$IMG"

magick "$IMG" \
  -scale 10% \
  -blur 0x2.5 \
  -resize 1000% "$IMG"

[[ "$1" ]] && magick "$IMG" \
  -gravity North \
  -pointsize 40 \
  -fill white \
  -font "MesloLGS-NF-Regular" \
  -annotate +0+100 "$1" "$IMG"

# Lock the screen with the blurred image
exec swaylock --daemonize --ignore-empty-password --image="$IMG"
