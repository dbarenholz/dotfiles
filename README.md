# dotfiles
My dotfiles. Always WIP. Now managed by [chezmoi](https://www.chezmoi.io).

## Chezmoi Cheatsheet

- `chezmoi status`: see if there are any differences between local machine and local repo
- `chezmoi add`: add things to the dotfiles repo (does not "re-add" after changes have been made to the original file)
- `chezmoi cd`: enter the chezmoi repo - then, make changes as required (e.g. for removing files/directories)

## Dotfiles

Dotfiles are used to configure various tools and programs.
Each folder has its own README for why it exists.

- `dot_aliases`: My shell aliases, imported by my `zhsrc` file.
- `dot_ghci`: Modify the [ghci](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/ghci.html#id2) prompt to show which modules are imported.
- `dot_p10k.zsh`: The generated Powerlevel10k configuration. This is for the shell prompt.
- `dot_zshrc`: My shell rc file. Contains various shell exports as well as modifications to `$PATH` so I can run tools.
- `README.md` : You're reading it.
