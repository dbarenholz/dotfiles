#!/bin/bash

# This is an attempt at updating _all_ things on the system.
# For now, it is created solely for `dan@fedora`, but may be extended later.
# Usage: ./update.sh

function category {
  echo -e "\u001b[31m=======================================\u001b[0m"
  echo -e "\u001b[31mUpdating '$1'...\u001b[0m"
  echo -e "\u001b[31m=======================================\u001b[0m"
}
function cmd {
  echo -e "\u001b[31m\t$1\u001b[0m"
  eval "$1"
}

# category "system" # this is already done for me
# cmd "rpm-ostree upgrade"

category "flatpaks"
cmd "flatpak update --noninteractive --assumeyes"

category "distroboxes"
cmd "distrobox enter dev -- sudo pacman -Syu --noconfirm"
cmd "distrobox enter sb -- sudo pacman -Syu --noconfirm"

category "$HOME/bin"
cmd 'distrobox enter dev -- zsh -i -c "nvm use --lts"'
cmd 'distrobox enter dev -- zsh -i -c "npm i -g bash-language-server"'

## NOTE: The dev distrobox already updates following items
# sl, rg, code, fd, figlet, lolcat, lua-language-server, marksman,
# vscode-css-language-server, vscode-html-language-server, vscode-json-language-server

## NOTE: The sb distrobox already updates following items:
# wf-recorder, bat, mpv, mullvad
