#!/bin/bash

# backup
mkdir ~/backup 
mv ~/.bash_profile ~/.vim ~/.vimrc ~/.screenrc backup

# get dotfiles
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone git@github.com:nudelfabrik/.dotfiles.git

# make symlinks
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/screenrc ~/.screenrc
