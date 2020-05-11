#!/bin/sh

# backup
mkdir ~/dotfiles_backup 
mv ~/.bash_profile ~/.vim ~/.vimrc ~/.gitconfig ~/.tmux.conf ~/.screenrc ~/dotfiles_backup
# make symlinks
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.dotfiles/nvim $XDG_CONFIG_HOME/nvim
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/psqlrc ~/.psqlrc
mkdir ~/.vimtmp
git submodule init
git submodule update
# sometimes submodule do not pull corretly, use
# git submodule foreach git pull
# additional attention to oh-my-zsh:
# might have to do git pull remote (or similar)
