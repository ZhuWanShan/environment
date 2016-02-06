#!/bin/sh

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.tmux && cd ~/.tmux

if [ -d tmux-powerline ]
then
    cd tmux-powerline && git pull https://github.com/erikw/tmux-powerline
else
    git clone https://github.com/erikw/tmux-powerline     
fi

cp $BASE/.tmux.conf ~/

exit 0


