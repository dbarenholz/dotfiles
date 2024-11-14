## zsh

I use the [zsh](<https://www.zsh.org>) shell for my system.
This directory (`.config/zsh`) contains convenience scripts that are sourced from my [`zshrc`](<https://github.com/dbarenholz/dotfiles/blob/main/dot_zshrc>).

### Scripts

- `add_path.zsh`: don't add items to `$PATH` if it's already in there.
- `check_bin.zsh`: provides `check_bin`, a function to check if a binary is runnable on the system. Requires `sed`.
- `plugins.zsh`: an effective zsh plugin manager. You don't need [`oh-my-zsh`](<https://ohmyz.sh>) or similar.
- `ssh.zsh`: a helper script for ssh sessions.
