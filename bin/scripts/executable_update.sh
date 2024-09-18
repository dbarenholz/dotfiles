#!/usr/bin/env bash

# Run on host if inside container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v update.sh)"

function category() {
  echo -e "\u001b[31m=======================================\u001b[0m"
  echo -e "\u001b[31mUpdating '$1'...\u001b[0m"
  echo -e "\u001b[31m=======================================\u001b[0m"
}

function cmd() {
  echo -e "\u001b[31m\t$1\u001b[0m"
  eval "$1"
}

category "flatpaks"
cmd "flatpak update --noninteractive --assumeyes"

category "distroboxes"
for BOX in $(distrobox ls --no-color | cut -d\| -f2 | tail -n +2); do
  cmd "distrobox enter $BOX -- sudo dnf update -y"
done
