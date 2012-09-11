#!/bin/bash

# backup
mkdir ~/dotfiles_backup 
mv ~/.bash_profile ~/.vim ~/.vimrc ~/.gitconfig ~/.screenrc ~/backup
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
mkdir ~/.vimtmp
