#!/bin/zsh

# This gets executed for dev/site help calls
function help_dev_site() {
  # TODO: Allow tab-completion to select an item to do
  echo "Jekyll uses ruby, which uses bundler"
  echo "-> dev: bundle exec jekyll serve"
  echo "-> build: bundle exec jekyll build"
}

function help_haskell_fun() {
  # TODO: Tab completion
  echo "Haskell uses gci to compile a binary"
  echo "-> ghci -o file file.hs"
  echo "   ./file"
}

function help() {
  D="$(pwd)/"
  [[ "$D" == *"dev/site"* ]] && help_dev_site
  [[ "$D" == *"dev/haskell-fun"* ]] && help_haskell_fun
}
