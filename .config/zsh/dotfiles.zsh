dotfiles() {
  REQUIRED_TOOLS=(cp ln dirname realpath git)
  for tool in ${REQUIRED_TOOLS[@]}; do
    if ! [[ -x "$(command -v $tool)" ]]; then
      echo "$tool could not be found"
      return
    fi
  done

  readonly DOTFILES="/home/dan/.dotfiles"
  if ! [[ -w "$DOTFILES" ]]; then
    echo "You do not have write access to the dotfiles directory: $DOTFILES"
    return
  fi

  # TODO: replace with fancy menu
  if [[ $# -lt 1 ]]; then
    echo "Usage: dotfiles <task> <optional arguments>"
    echo "       dotfiles add file.ext"
    echo "       dotfiles add folder"
    echo "       dotfiles update"
    return
  fi

  VALID_TASKS=("a" "add" "u" "update")
  readonly task=${1:?"Action must be specified"}
  if ! [[ ${VALID_TASKS[@]} =~ $task ]]; then
    echo "Invalid task given: $task."
    return
  fi

  if [[ "$task" -eq "add" || "$task" -eq "a" ]]; then
    for arg in "${@:2}"; do
      DIRS="$(dirname $(realpath --relative-to=$HOME $(pwd)/$arg))"
      mkdir -p $DOTFILES/$DIRS

      if [[ -d "$arg" ]]; then
        cp -al $(pwd)/$arg $DOTFILES/$DIRS

      elif [[ -f "$arg" ]]; then
        ln -ivt $DOTFILES/$DIRS $arg
      else
      fi
    done
  fi

  if [[ "$task" -eq "update" || "$task" -eq "u" ]]; then
    echo "Pushing to git"
    git -C $DOTFILES add .
    git -C $DOTFILES commit -S -m "Update dotfiles"
    git -C $DOTFILES push
    cd -
  fi
}
