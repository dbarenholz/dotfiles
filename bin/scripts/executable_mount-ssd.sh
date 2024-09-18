#!/usr/bin/env bash

# Run on host if inside container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v mount-ssd.sh)"

function cmd() {
  echo -e "\u001b[31m$1\u001b[0m"
  eval "$1"
}

cmd "sudo mkdir -p /run/media/dan/ssd/"
cmd "sudo mount /dev/sda1 /run/media/dan/ssd"
