#!/bin/zsh

## Locking script that sets a blurred lockscreen with optional text
# Uses grim, swaylock and imagemagick.
# Usage: 
#   lock.sh        --> locks the screen with a blurred image
#   lock.sh "text" --> locks the screen with a blurred image, with text on top

grim "$HOME/.swaylock/img"

convert "$HOME/.swaylock/img" \
  -scale 10% \
  -blur 0x2.5 \
  -resize 1000% "$HOME/.swaylock/img"

[[ "$1" ]] && convert "$HOME/.swaylock/img" \
  -gravity North \
  -pointsize 40 \
  -fill white \
  -font "MesloLGS-NF-Regular" \
  -annotate +0+100 "$1" "$HOME/.swaylock/img"

# Lock the screen with the blurred image
exec swaylock --daemonize --ignore-empty-password --image="$HOME/.swaylock/img"
