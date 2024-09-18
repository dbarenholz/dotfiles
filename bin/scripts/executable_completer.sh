#!/usr/bin/env bash

# Run on host if inside container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v completer.sh)"

SNIPPETS="$HOME/.config/snippets"
FNAME="$(find "$SNIPPETS" -type f -printf "%f\n" | rofi -dmenu -matching fuzzy -sort)"
FPATH="$(find "$SNIPPETS" -name "$FNAME" -print -quit)"
wl-copy <"$FPATH"
