# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=1000
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dan/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# aliases
[[ -f "/home/dan/.aliases" ]] && source "/home/dan/.aliases"

# Fix: keybinds
bindkey  "^[[H"    beginning-of-line # Home
bindkey  "^[[F"    end-of-line       # End
bindkey  "^[[3~"   delete-char       # Delete
bindkey  "^[[1;5C" forward-word      # CTRL+Right
bindkey  "^[[1;5D" backward-word     # CTRL+Left

# tab completion on menus
zstyle ':completion:*' menu select

# Set terminal to something distrobox understands
export TERM=xterm-256color

# Include binaries from home
export PATH=$PATH:/home/dan/bin

export EDITOR=nvim
export GTK_THEME=Adwaita:dark

# p10k - fancy prompts!
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# plugins
#  format: 'github-user/repo-name'
#  usage: `source plugins.zsh` file; this will install it
plugins=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
)
source ~/.config/zsh/plugins.zsh

# custom functions for various reasons
# source ~/.config/zsh/dotfiles.zsh
