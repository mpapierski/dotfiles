#!/usr/bin/env bash

# A script to automate tasks

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
    rsync --exclude ".git/" \
          --exclude ".DS_Store" \
          --exclude ".gitmodules" \
          --exclude "bootstrap.sh" \
          -avh --no-perms . ~;
    source ~/.bash_profile;
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
