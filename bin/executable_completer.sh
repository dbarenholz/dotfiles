#!/bin/bash
SNIPPETS="$HOME/.config/snippets"
FNAME="$(find "$SNIPPETS" -type f -printf "%f\n"| rofi -dmenu -matching fuzzy -sort)"
FPATH="$(find "$SNIPPETS" -name "$FNAME" -print -quit)"
wl-copy < "$FPATH"
