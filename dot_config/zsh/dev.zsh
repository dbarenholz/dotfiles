#!/bin/zsh

## Dev script
# Description:
#   Select which project to open in nvim.
# Usage:
#   Type `dev` in a terminal.
# Last Edit:
#   2024-11-16: create the thing

dev() {

  [[ -f "$HOME/.config/zsh/check_bin.zsh" ]] && source "$HOME/.config/zsh/check_bin.zsh"  # provides check_bin <bin>

  # Verify we have the binaries
  check_bin "fzf"
  check_bin "nvim"
  check_bin "find"

  # Where the projects live
  PROJECTS_DIR="$HOME/dev"

  # Select the desired project
  PROJECT="$(find $PROJECTS_DIR -maxdepth 1 | fzf)"

  # If none selected, set project to current working directory
  if [ -z "$PROJECT" ]; then
    PROJECT="$PWD"
  fi

  # Open the project with your desired editor
  nvim "$PROJECT"
}
