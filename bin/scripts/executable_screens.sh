#!/bin/zsh

## Screen layout switcher
# Description:
#   Select your desired screenlayout (for X only), and it'll switch to it.
# Usage:
#   Bind it to a hotkey for use in a window manager.
# Last Edit:
#   2024-11-11: write the thing

if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  [[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

  # Verify we have required binaries
  check_bin "find"
  check_bin "rofi"
  check_bin "xrandr"

  # Where screenlayouts are stored
  LAYOUT_DIR="$HOME/.screenlayout"

  # Show each layout's name in rofi
  LAYOUT_NAME="$(find "$LAYOUT_DIR" -type f -printf "%f\n" | rofi -dmenu -matching fuzzy -sort)"

  # Get the path of the selected layout
  LAYOUT_PATH="$(find "$LAYOUT_DIR" -name "$LAYOUT_NAME" -print -quit)"

  # A layout is a script that calls xrandr. Call it to set the desired layout
  exec "$LAYOUT_PATH"
fi

