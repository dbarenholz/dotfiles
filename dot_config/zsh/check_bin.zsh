#!/bin/zsh
# Check if a particular command is available on the system
# usage:
#   check_bin <binary name or path to run>
REQUIRED=("notify-send" "sed")

# Check for required binaries
for TOOL in "${REQUIRED[@]}"; do
  if ! command -v "$TOOL" 2>&1 >/dev/null; then
    echo "[check-bin.sh] Please install '$TOOL' to use this function."
    exit 1
  fi
done

unset REQUIRED

check_bin () {
  # command -v checks if it's a command - does not work for aliases sourced in .zsh
  if ! command -v "$1" 2>&1 >/dev/null; then
    # try to check if it's an alias
    ALIASES_FILE="$HOME/.aliases"
    ALIAS_NAMES="$(cat "$ALIASES_FILE" | sed s/'alias '// | sed s/'#.*'// | sed s/'=.*'// )";
    if [[ ! $ALIAS_NAMES == *"$1"* ]]; then
      # It's not a command, and not an alias
      MSG="[check-bin.sh] Potentially aliased binary/command '$1' could not be found"
      notify-send -u critical "$MSG"
      echo "$MSG"
      exit 1
    fi
  fi
}
