#!/bin/zsh

## Brightness helper
# Description:
#   Helper script to display notifications when changing monitor brightness.
# Usage:
#   Bind to brightness up and brightness down keys in your window manager.
# Last Edit:
#   2024-11-10: write the thing

[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# Verify we have required binaries
check_bin "brightnessctl"
check_bin "cut"
check_bin "tr"
check_bin "notify-send"

# Get percentage value
PERCENTAGE="$(brightnessctl -m  | cut -d, -f4 | tr -d %)"

# Then send notification
notify-send -e -h string:x-canonical-private-synchronous:brightness -h "int:value:$PERCENTAGE" -t 800 "Brightness: ${PERCENTAGE}%"

# Cleanup
unset PERCENTAGE
