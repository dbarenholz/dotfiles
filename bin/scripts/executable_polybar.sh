#!/bin/zsh

## Polybar
# Description:
#   Starts polybar in the (almost) desired configuration.
#   note: This (for now) only works on a reload of i3.
#         Executing polybar.sh in a layout file (.screenlayout/layout.sh) does not seem to work.
# Usage:
#   Set it to run as bar in your `i3` configuration.
# Last Edit:
#   2024-11-11: attempt to make it work with multiple monitors, and make progress

[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# Verify we have required binaries
check_bin "polybar"
check_bin "cut"
check_bin "tee"

# Quit existing bars (if any)
killall -q polybar

# INFO: ZSH-specific syntax; get list of monitors
MONITORS=("${(@f)$(polybar --list-monitors | cut -d':' -f1)}")

# If we have a single one
if [[ "${#MONITORS[@]}" == 1 ]]; then
  # Then put the bar with the tray on the specific monitor
  MONITOR="$MONITORS" polybar --reload top-with-tray 2>&1 | tee -a /tmp.polybar.log & disown
else
  for M in "${MONITORS[@]}"; do
    # TODO: This only works with a 2nd display... so the loop is almost useless.
    if [[ "$M" == "HDMI-1-0" ]]; then
      MONITOR="$M" polybar --reload top-with-tray 2>&1 | tee -a /tmp/polybar.log & disown
    else
      MONITOR="$M" polybar --reload top-no-tray 2>&1 | tee -a /tmp/polybar.log & disown
    fi
  done
fi
