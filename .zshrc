# If you come from bash you might have to change your $PATH.
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"

plugins=(git virtualenvwrapper pip brew docker go)

source $ZSH/oh-my-zsh.sh

# Make command line clipboard working on Linux too.
# See: http://superuser.com/questions/288320/whats-like-osxs-pbcopy-for-linux
if command -v xsel >/dev/null 2>&1; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
elif command -v xclip >/dev/null 2>&1; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# Make `open` working on Linux too.
if command -v xdg-open >/dev/null 2>&1; then
    alias open='xdg-open &>/dev/null'
fi


# Load tmux statusline
. ~/.local/bin/my-tmux-status
