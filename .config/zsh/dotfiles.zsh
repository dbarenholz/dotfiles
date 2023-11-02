dotfiles() {
  REQUIRED_TOOLS=(cp ln dirname realpath git)
  for tool in ${REQUIRED_TOOLS[@]}; do
    if ! [[ -x "$(command -v $tool)" ]]; then
      echo "$tool could not be found"
      return
    fi
  done

  readonly DOTFILES="$HOME/.dotfiles"
  if ! [[ -w "$DOTFILES" ]]; then
    echo "You do not have write access to the dotfiles directory: $DOTFILES"
    return
  fi

  if [[ $# -lt 1 ]]; then
    echo "Usage: dotfiles [task] [optional arguments]"
    echo "Examples"
    echo "       dotfiles [a/add] file.ext  add file.ext to dotfiles"
    echo "       dotfiles [a/add] folder    add folder to dotfiles"
    echo "       dotfiles [u/update]        commit and push dotfiles to git"
    return
  fi

  readonly task=${1:?"Action must be specified.\n$(dotfiles)"}
  case "$task" in

    "a" | "add")
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
      ;;

    "u" | "update")
      echo "Pushing to git"
      git -C $DOTFILES add .
      git -C $DOTFILES commit -S -m "Update dotfiles"
      git -C $DOTFILES push
      ;;
   
    *)
      echo "Invalid task given: $task.\n$(dotfiles)"
      return 

  esac
}
