#!/usr/bin/env bash

# Run on host if insider container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v fix-grub.sh)"

function cmd() {
  echo -e "\u001b[31m$1\u001b[0m"
  eval "$1"
}

FILE="/boot/loader/grub.cfg"

echo "Modify "$FILE" manually; ensure these lines are commented"
cmd "sudo grep -n -A 5 "windows" "$FILE""
