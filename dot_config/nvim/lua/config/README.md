## ~/.config/nvim/lua/config

This is the part of my [`nvim`](<https://github.com/dbarenholz/dotfiles/tree/main/dot_config/nvim>) configuration that describes the configuration! :^)

In particular, the following items live here:

- `autocmds.lua`: My [`autocmd`](<https://neovim.io/doc/user/autocmd.html>)s live here.
- `functions.lua`: This is a helper for the [script](<https://github.com/dbarenholz/dotfiles/blob/main/dot_config/nvim/executable_generate_plugin_list.sh>) I use to generate a list of plugins.
- `keybinds.lua`: This is where I set my keybinds.
- `options.lua`: This is where I set some basic options, such as using the system clipboard and relative line numbers.
- `zsh-as-sh.lua`: This is a nifty little trick from [here](<https://nanotipsforvim.prose.sh/treesitter-and-lsp-support-for-zsh>) used to ensure that `zsh` scripts are treated as if it's a `sh` filetype.

