#!/bin/zsh

## Locking script that sets a blurred lockscreen with optional text
# Uses grim, swaylock and imagemagick.
# Usage:
#   lock.sh        --> locks the screen with a blurred image
#   lock.sh "text" --> locks the screen with a blurred image, with text on top

IMG="$HOME/tmp/swaylock.img"

grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" "$IMG"

convert "$IMG" \
  -scale 10% \
  -blur 0x2.5 \
  -resize 1000% "$IMG"

[[ "$1" ]] && convert "$IMG" \
  -gravity North \
  -pointsize 40 \
  -fill white \
  -font "MesloLGS-NF-Regular" \
  -annotate +0+100 "$1" "$IMG"

# Lock the screen with the blurred image
exec swaylock --daemonize --ignore-empty-password --image="$IMG"
