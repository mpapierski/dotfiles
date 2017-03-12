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

plugins=(git virtualenvwrapper pip brew docker go)

source $ZSH/oh-my-zsh.sh

### Additional scripts {{{

# Load aliases
. ~/.aliases

# Load functions
. ~/.functions

### }}}

### Misc {{{

# Load tmux statusline
. ~/.local/bin/my-tmux-status

### }}}
