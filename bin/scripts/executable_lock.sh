#!/bin/zsh

## Lock script
# Description:
#   Locks the screen with my desired lockscreen.
# Usage:
#   Bind it to a hotkey for use in a window manager
# Last Edit:
#   2024-11-10: make it work on X


[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# Run on host if inside container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v lock.sh)"

# The image is stored as hidden file
IMG="$HOME/.lock.png"

# Use imagemagick to (quickly) blur the image
blur_image () {
  check_bin "magick"
  magick "$IMG" -scale 10% -blur 0x2.5 -resize 1000%  -fill black -colorize 20% "$IMG"
}

# When on wayland, assume immutable OS, sway and swaylock
# TODO: Verify this works when I'm back on wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  check_bin "grim"
  check_bin "jq"
  check_bin "swaylock"
  check_bin "swaymsg"

  # make screenshot
  grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" "$IMG"
  # blur image
  blur_image
  # invoke lockscreen (swaylock)
  exec swaylock --daemonize --ignore-empty-password --image="$IMG"
fi

# When on X, assume arch, i3 and i3lock
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  check_bin "scrot"
  check_bin "i3lock"
  # make screenshot
  scrot -o "$IMG"
  # blur image
  blur_image

  # halcyonify i3lock-color
  BLANK='#00000000'
  HLCN_TEXT='#d7dce2'
  HLCN_TEXT_BG='#171c28'
  HLCN_TEXT_MUTED='#8695b799'
  HLCN_ACCENT='#ffcc66'
  HLCN_OK='#bae67e'
  HLCN_BAD='#ef6b73'
  HLCN_CHECK='#c3a6ff'

  # invoke lockscreen (aur/i3lock-color)
  exec i3lock \
    --insidever-color=$HLCN_TEXT_BG   \
    --insidewrong-color=$HLCN_TEXT_BG \
    --inside-color=$HLCN_TEXT_BG      \
    \
    --ringver-color=$HLCN_CHECK  \
    --ringwrong-color=$HLCN_BAD  \
    --ring-color=$HLCN_ACCENT    \
    --line-color=$BLANK          \
    \
    --keyhl-color=$HLCN_OK          \
    --separator-color=$HLCN_TEXT_BG \
    \
    --verif-color=$HLCN_CHECK       \
    --wrong-color=$HLCN_BAD         \
    --modif-color=$HLCN_CHECK       \
    --time-color=$HLCN_TEXT         \
    --date-color=$HLCN_TEXT_MUTED   \
    --layout-color=$HLCN_TEXT_MUTED \
    \
    --time-str="%H:%M"    \
    --date-str="%Y-%m-%d" \
    --indicator           \
    --clock               \
    --keylayout 1         \
    \
    --time-font="MesloLGSNerdFontMono" \
    --date-font="MesloLGSNerdFontMono" \
    --layout-font="MesloLGSNerdFontMono" \
    --verif-font="MesloLGSNerdFontMono" \
    --wrong-font="MesloLGSNerdFontMono" \
    --image="$IMG"
fi

unset IMG
