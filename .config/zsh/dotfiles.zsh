dotfiles() {
  # TODO: Check for 
  #    cp
  #    ln
  #    dirname
  #    realpath

  # Where dotfiles are stored
  readonly DOTFILES="/home/dan/.dotfiles"

  # TODO: Check for being able to read DOTFILES directory

  # Print some usage if you just run it: TODO: replace with fancy menu
  if [[ $# -lt 1 ]]; then
    echo "Usage: dotfiles <task> <optional arguments>"
    echo "       dotfiles add file.ext"
    echo "       dotfiles add folder"
    echo "       dotfiles update"
    return
  fi

  # Actual functionality
  readonly task=${1:?"Action must be specified"}
  if [[ "$task" -eq "add" || "$task" -eq "a" ]]; then
    # dotfiles add <list of files or folders>
    for arg in "${@:2}"; do
      # Extract directories to make, and make them
      DIRS="$(dirname $(realpath --relative-to=$HOME $(pwd)/$arg))"
      mkdir -p $DOTFILES/$DIRS

      # folder: use cp -ali
      if [[ -d "$arg" ]]; then
        cp -al $(pwd)/$arg $DOTFILES/$DIRS

      # file: use ln -ivt
      elif [[ -f "$arg" ]]; then
        ln -ivt $DOTFILES/$DIRS $arg
      else
      fi
    done
  fi
}
