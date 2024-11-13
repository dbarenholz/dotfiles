#!/bin/zsh

## Completer
# Description:
#   Given a folder of snippets, completer copies a selected snippets' content to the clipboard.
# Usage:
#   Bind it to a hotkey for use in a window manager.
# Last Edit:
#   2024-11-12: make it work on X


[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# Run on host if inside container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v completer.sh)"

# Verify we have the binaries
check_bin "find"
check_bin "rofi"  # NOTE: this can be both X or rofi-wayland for Wayland

# Snippets are always located at this place
SNIPPETS="$HOME/.config/snippets"
FNAME="$(find "$SNIPPETS" -type f -printf "%f\n" | rofi -dmenu -matching fuzzy -sort)"
FPATH="$(find "$SNIPPETS" -name "$FNAME" -print -quit)"

# TODO: Verify this still works when I'm back on wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  check_bin "wl-copy"
  wl-copy <"$FPATH"
fi

if [ "$XDG_SESSION_TYPE" = "x11" ]; then
  check_bin "xclip"
  xclip -sel clip <"$FPATH"
fi
