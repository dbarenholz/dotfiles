#!/bin/zsh
# Set plugin folder
# Note: this is _not_ in /zsh/plugins so I can easily exclude it from chezmoi repo
PLUGINS="$HOME/.config/zsh-plugins"

# The "$plugins" variable is defined in .zshrc
for plugin in $plugins; do
  plugin_dir="$PLUGINS/$plugin"

  # clone the plugin
  if [[ ! -d "$plugin_dir" ]]; then
    mkdir -p "${plugin_dir%/*}"
    git clone --depth 1 --recursive "https://github.com/$plugin.git" "$plugin_dir"
  fi

  # load the plugin
  for init_script in "${plugin#*/}.zsh" "${plugin#*/}.plugin.zsh" "${plugin#*/}.sh"; do
    if [[ -f "$plugin_dir/$init_script" ]]; then
      source "$plugin_dir/$init_script"
      break
    fi
  done
done

# clean up
unset plugin_dir
unset plugin
unset PLUGINS
unset init_script
