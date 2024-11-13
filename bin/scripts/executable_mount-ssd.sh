#!/bin/zsh

## ftab scares me so I have a script
# Description:
#   Mounts my internal SSD at the desired location
# Usage:
#   Run it in a terminal
# Last Edit:
#   2024-11-12: fix environment and syntax
# Run on host if inside container
[ -n "$CONTAINER_ID" ] && exec distrobox-host-exec "$(command -v mount-ssd.sh)"

# Used to display in red the command that gets ran
cmd() {
  echo -e "\u001b[31m$1\u001b[0m"
  eval "$1"
}

# Execute these two commands
cmd "sudo mkdir -p /run/media/dan/ssd/"
cmd "sudo mount /dev/sda1 /run/media/dan/ssd"
