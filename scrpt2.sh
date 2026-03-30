#!/bin/bash
# Script 2: FOSS Package Inspector

PACKAGE="git"

if command -v $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed."
    git --version
else
    echo "$PACKAGE is NOT installed."
fi

case $PACKAGE in
    git) echo "Git: distributed version control built for open collaboration" ;;
    apache) echo "Apache: powers a huge portion of the web" ;;
    mysql) echo "MySQL: database behind countless applications" ;;
    vlc) echo "VLC: media player that supports almost everything" ;;
esac
