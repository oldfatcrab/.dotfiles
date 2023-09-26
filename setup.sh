#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sleep 5
rm -rf $HOME/.z*

# create symbolic link to dotfiles
ln -s $(pwd)/zshrc $HOME/.zshrc
ln -s $(pwd)/zshenv $HOME/.zshenv
ln -s $(pwd)/zlogin $HOME/.zlogin
ln -s $(pwd)/zprofile $HOME/.zprofile
ln -s $(pwd)/zlogout $HOME/.zlogout
