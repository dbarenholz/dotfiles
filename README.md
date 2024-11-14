## dotfiles

My dotfiles. Always WIP. Now managed by [chezmoi](https://www.chezmoi.io).

### Dotfiles

[Dotfiles](<https://wiki.archlinux.org/title/Dotfiles>) are used to configure various tools and programs.
Each folder has its own README that describes why it exists, and what it does. Most files are commented, too.

- `.aliases`: My shell [aliases](<https://wiki.archlinux.org/title/Bash#Aliases>), imported by my `.zhsrc` file.
- `bin`: A folder with my binaries and scripts.
- `.config`: The main configuration folder on linux.
- `.ghci`: Modify the [ghci](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/ghci.html#id2) prompt to show which modules are imported.
- `.p10k.zsh`: The generated [powerlevel10k](<https://github.com/romkatv/powerlevel10k>) configuration.
- `.screenlayout`: Folder containing screenlayouts for my [X](<https://wiki.archlinux.org/title/Xorg>) session.
- `.xinitrc`: Initializes an [X](<https://wiki.archlinux.org/title/Xorg>) session. I tell it to run [`i3`](<https://wiki.archlinux.org/title/I3>).
- `.zshrc`: My [zsh](<https://www.zsh.org>) configuration. Contains various shell exports as well as modifications to `$PATH` so I can run tools.
- `README.md` : You're reading it.

### System-wide configuration

Chezmoi isn't made to manage these files. I'm mostly writing this down here for myself, so I know these are modified, and for what reason they are modified.

- `/etc/ly/config.ini`: check [`Ly`](<https://github.com/fairyglade/ly>) for details; configuration file for ly, my display manager.
- `/etc/vtconsole.conf`: check [`mkinitcpio-colors`](<https://github.com/evanpurkhiser/mkinitcpio-colors>) for details; modified to halcyonify colors.
- `/etc/mkinitcpio.conf`: check [`mkinitcpio-colors`](<https://github.com/evanpurkhiser/mkinitcpio-colors>) for details; add `colors` to `HOOKS`.
- `/etc/initcpio/install/colors` and `/etc/initcpio/install/sd-colors`: check [`mkinitcpio-colors`](<https://github.com/evanpurkhiser/mkinitcpio-colors>) for details; install `mkinitcpio-colors`.
- `/etc/initcpio/hooks/colors`: check [`mkinitcpio-colors`](<https://github.com/evanpurkhiser/mkinitcpio-colors>) for details: install `mkinitcpio-colors`.

- `/etc/systemd/system/setcolors.service`: check [`mkinitcpio-colors`](<https://github.com/evanpurkhiser/mkinitcpio-colors>) for details; install `mkinitcpio-colors`.


### Chezmoi Cheatsheet

- [`chezmoi managed`](<https://www.chezmoi.io/reference/commands/managed/>): see files managed by chezmoi
- [`chezmoi unmanaged`](<https://www.chezmoi.io/reference/commands/unmanaged/>): see files _not_ managed by chezmoi
- [`chezmoi status`](<https://www.chezmoi.io/reference/commands/status/>): see if there are any differences between local machine and local repo
- [`chezmoi add`](<https://www.chezmoi.io/reference/commands/add/>): add things to the dotfiles repo
- [`chezmoi forget`](<https://www.chezmoi.io/reference/commands/forget/>): remove things from the dotfiles repo
- [`chezmoi edit`](<https://www.chezmoi.io/reference/commands/edit/>): command to use when editing files
