#!/bin/zsh

## Screenshot utility
# Description:
#   Make a screenshot of a desired area, and save it to the clipboard.
# Usage:
#   Bind it to a hotkey for use in a window manager.
# Last Edit:
#   2024-11-11: make it work on X

[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# When on wayland, assume grim, slurp, wl-copy
# TODO: Verify this still works when I'm back on wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  check_bin.sh "grim"
  check_bin.sh "slurp"
  check_bin.sh "wl-copy"
  grim -g "$(slurp)" - | wl-copy
fi

# When on X, assume scrot, xclip
if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  check_bin "scrot"
  check_bin "xclip"
  scrot --select --exec 'xclip -selection clipboard -t image/png -i $f && mv $f ~/Pictures/Screenshots/'
fi

