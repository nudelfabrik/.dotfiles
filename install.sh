#!/bin/bash

# backup
mkdir ~/dotfiles_backup 
mv ~/.bash_profile ~/.vim ~/.vimrc ~/.gitconfig ~/.tmux.conf ~/.screenrc ~/dotfiles_backup
# make symlinks
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/screenrc ~/.screenrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
mkdir ~/.vimtmp
