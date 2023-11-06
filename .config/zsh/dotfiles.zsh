#!/bin/zsh
dotfiles() {
  # Check if required tools exist
  # Note: finicky when you have 'alias cat=bat'
  local REQUIRED_TOOLS=(cp ln cat cut basename dirname realpath git)
  for tool in ${REQUIRED_TOOLS[@]}; do
    local CMD="$(command -v "$tool")"
    [[ "$CMD" == *"alias"* ]] && CMD="$(echo "$CMD" | cut -d= -f2)"
    [[ ! -x "$CMD" ]] && echo "$tool could not be found" && return
  done

  # Check write access to $DOTFILES folder
  readonly local DOTFILES="$HOME/.dotfiles"
  if ! [[ -w "$DOTFILES" ]]; then
    echo "You do not have write access to the dotfiles directory: $DOTFILES"
    return
  fi

  # Print "help" if no arguments
  if [[ $# -lt 1 ]]; then
    cat << END_HELP
Usage:
  dotfiles [a/add] <list of files and/or folders>'
      -> Add all arguments to $DOTFILES, and make a commit.'
  dotfiles [u/update]"
      -> Make a commit (if needed) and push all changes."
Note:
  The command is meant to be given arguments from $HOME/.config/ (or similar place)
  and then the script will copy the arguments to $DOTFILES, 
  and make symlinks from $HOME/.config/ -> $DOTFILES.
END_HELP
    return
  fi

  # Actual functionality starts here
  readonly local task=${1:?"Action must be specified.\n$(dotfiles)"}

  case "$task" in

    "a" | "add")
      for arg in "${@:2}"; do
	# Check if argument is a file/folder
	if ! [[ -d "$arg" || -f "$arg" ]]; then
	  echo "Argument is not a file or folder."
	  return
	fi
	
	# 0. Do some path magic to find the right places to copy/link from/to
	
	local BASENAME="$(basename "$arg")"
	#echo "BASENAME=$BASENAME"
	local FULLPATH="$(realpath "$arg")"
	#echo "FULLPATH=$FULLPATH"
	local RELPATH="$(realpath --relative-to "$HOME" "$FULLPATH")"
	#echo "RELPATH=$RELPATH"
	local DIRS="$(dirname "$RELPATH")"
	#echo "DIRS=$DIRS"
	local MAKEDIRS="$(realpath "$DOTFILES/$DIRS")"
	#echo "MAKEDIRS=$MAKEDIRS"

	[[ ! -d "$MAKEDIRS" ]] && mkdir -p "$MAKEDIRS"
	
	# 1. Copy source files to dotfiles
	# echo "cp -ir "$FULLPATH" "$MAKEDIRS""
	cp -ir "$FULLPATH" "$MAKEDIRS"


	# 2. Symlink from source files _to_ (real) dotfiles
	[[ -f "$FULLPATH" ]] && ln -ivs "$MAKEDIRS/$BASENAME" "$FULLPATH"
	if [[ -d "$FULLPATH" ]]; then
	  rm -rf "$FULLPATH" # when working with directories
          ln -ivs "$MAKEDIRS/$BASENAME" "$(dirname "$FULLPATH")"
	fi

	# 3. Make a git commit with the change
	git -C "$DOTFILES" add .
	git -C "$DOTFILES" commit -S -m "Add $BASENAME"
      done
      ;;

    "u" | "update")
      echo "Pushing to git"
      git -C "$DOTFILES" add .
      git -C "$DOTFILES" commit -S -m "Update dotfiles"
      git -C "$DOTFILES" push
      ;;
   
    *)
      echo "Invalid task given: $task.\n$(dotfiles)"
      return 

  esac
}
