#!/bin/zsh

## Audio helper
# Description:
#   Helper script to display notifications when changing volume.
# Usage:
#   Bind to volume up and volume down keys in your window manager.
# Last Edit:
#   2024-11-10: write the thing

[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# Verify we have required binaries
check_bin "pactl"
check_bin "grep"
check_bin "head"
check_bin "notify-send"

# Get percentage value
PERCENTAGE="$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)"

# Then send notification
notify-send -e -h string:x-canonical-private-synchronous:volume -h "int:value:$PERCENTAGE" -t 800 "Volume: ${PERCENTAGE}%"

# Cleanup
unset PERCENTAGE
