#!/usr/bin/env bash
# vim: set expandtab ts=4 sw=4:

# A script to automate tasks

cd "$(dirname "${BASH_SOURCE}")";

basic_packages=(
    "git"
    "vim"
    "zsh"
    "vim"
    "tmux"
    "fzf"
    # Those are just for fun
    "fortune"
    "cowsay"
    "lolcat"
)

function _is_linux() {
    [ "$(uname)" == "Linux" ];
}

function _is_ubuntu() {
    _is_linux && [[ "$(cat /etc/issue)" =~ "Ubuntu"* ]];
}

function _is_macos() {
    [[ "$(uname)" == "Darwin" ]];
}

function _check_status() {
    if "$@" >/dev/null 2>&1; then
        echo "✓";
    else
        echo "✗";
    fi
}

function _prepare_ubuntu() {
    echo -n "Update APT repositories... "
    _check_status sudo apt-get update -qq
}

function _prepare_system() {
    if _is_ubuntu; then
        _prepare_ubuntu
    fi
}

function _install_package() {
    echo -n "Install $1... "
    _check_status sudo apt-get install -qq -y $1
}

# The magic bootstrap
function bootstrap() {
    sudo echo "I am sudo!"
    # This will keep updating user's timestamp
    ( while true; do sudo -v; sleep 40; done >/dev/null) &
    _pid=$!

    # This is something like pre-bootstrap to make packages install
    _prepare_system

    # Install all basic packages
    for package in "${basic_packages[@]}";
    do
        _install_package $package
    done

    # Change shell to zsh
    sudo chsh -s /bin/zsh

    # No need for `sudo` anymore
    # TODO: This should be registered as trap signals
    kill $_pid
    sudo -k

    # At this point we're supposed to have git installed already
    # so lets proceed to cloning the repo
    git clone --recursive https://github.com/mpapierski/dotfiles ~/.dotfiles

    # Last final touch to make this script complete...
    fortune | cowsay | lolcat
}

function doIt() {
    # Check if bootstrapped already
    if [ ! -e ~/.dotfiles ]; then
        # This will do the initial bootstrap
        # with a bare minimum packages.
        bootstrap;
        pushd ~/.dotfiles
    fi
    rsync --exclude ".git/" \
          --exclude ".DS_Store" \
          --exclude ".gitmodules" \
          --exclude "bootstrap.sh" \
          --exclude "README.md" \
          -avh --no-perms . ~;
    popd >/dev/null 2>&1
}

OPTS=`getopt -o fh --long force,help -- "$@"`

FORCE=0

while true; do
    case "$1" in
        -f | --force )
            FORCE=1
            shift
            ;;
        -h | --help )
            echo "Usage: $0"
            exit
            ;;
        -- )
            shift
            break
            ;;
        * )
            break
            ;;
    esac
done

if [ $FORCE = 1 ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;

unset doIt;
