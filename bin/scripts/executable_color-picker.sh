#!/bin/zsh

## Color picker script.
# Description:
#   Gets the color of the current cursor position, and copies it to the clipboard in HEX format.
# Usage:
#   Either run it in a terminal, or bind it to a hotkey for use in a window manager
# Last Edit:
#   2024-11-12: make it work on X

[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# Run on host if inside container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v color-picker.sh)"

# Regardless of X or Wayland, we want these binaries
check_bin "notify-send"
check_bin "magick"

# When on wayland, assume immutable OS, slurp, and grim
# TODO: Verify this still works when I'm back on wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  check_bin "grim"
  check_bin "slurp"
  check_bin "wl-copy"

  # Get color position
  position="$(slurp -b 00000000 -p)"

  # Prevent issues with grim always returning improper color.
  sleep 1

  # Extract the color
  color="$(
    grim -g "$position" -t png - |
      magick - -format '%[pixel:p{0,0}]' txt:- |
      tail -n 1 |
      cut -d ' ' -f 4
  )"

  notify-send --urgency "normal" "color-picker.sh" "$color"
  echo "$color (copied to clipboard)"
  echo "$color" | wl-copy -n

  unset position
  unset color
fi

# When on X, assume arch, xdotool, scrot
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  check_bin "xdotool"
  check_bin "xclip"

  # Get current mouse position (this sets X and Y)
  # NOTE: the mouse position is relative to _everything_ as is normal with X
  #       so if the mouse is on a second monitor, it's normal to see X=3561 or some high number
  eval "$(xdotool getmouselocation --shell | head -n 2)"

  # Take screenshot of _everything_
  IMG="$HOME/.color-picker.png"
  scrot -o "$IMG"

  # Tell imagemagick to give me the RGB color of the position in the image
  color="$(magick "$IMG" -format "%[hex:u.p{$X,$Y}]" info:)"

  unset IMG
  unset X
  unset Y

  notify-send --urgency "normal" "color-picker.sh" "$color"
  echo "$color (copied to clipboard)"
  echo "$color" | xclip -sel clip
fi
