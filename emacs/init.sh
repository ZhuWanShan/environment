#!/bin/sh


synchronizeEmacs(){
    cp -R .emacs.d ~/
    echo "Init cask dependencies"
    cd ~/.emacs.d && cask install
}


if [ -d ~/.emacs.d ]
then
    echo "/.emacs.d is existing, synchronize emacs config files"
    synchronizeEmacs
else
    echo "~/.emacs.d is not existing, creating"
    mkdir -p ~/.emacs.d
    
fi

exit 0
