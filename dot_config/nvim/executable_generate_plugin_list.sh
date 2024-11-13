#!/bin/zsh
set -euo pipefail

[[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

# Verify we have required binaries
check_bin "sed"
check_bin "grep"
check_bin "nvim"
check_bin "cut"
check_bin "sort"
check_bin "dirname"

# cd to scripts directory before running
cd "$(dirname "$0")" || exit 1
README_FILE="./README.md"

# Yeet current list to smithereens - it is easier to rebuild than modify
LINE_MATCH="$(grep -n "## Installed plugins" "$README_FILE" | cut -d: -f1)"
LINE_NO="$(("$LINE_MATCH" + 1))"
sed -in "$LINE_NO,$ d" "$README_FILE"

# Get plugin list and write to readme file
echo "" >> $README_FILE
nvim --headless -c ':lua LIST_PLUGINS()' -c '-q'  | sort >> $README_FILE

rm "${README_FILE}n"

unset LINE_MATCH
unset LINE_NO
unset MD_LIST
unset README_FILE
