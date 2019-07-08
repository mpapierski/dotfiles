# If you come from bash you might have to change your $PATH.
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

# Disable automatic updates since we're managing oh-my-zsh on our own.
DISABLE_AUTO_UPDATE=true

plugins=(
    git
    pip
    brew
    docker
    go
    fzf
)

source $ZSH/oh-my-zsh.sh

### Additional scripts {{{

# Load aliases
. ~/.aliases

# Load functions
. ~/.functions

# Load exports
. ~/.exports

### }}}

### Misc {{{

# Load tmux statusline
. ~/.local/bin/my-tmux-status

### }}}

# Chain load local zshrc for local customization
[ -f ~/.zshrc.local ] && . ~/.zshrc.local
