#!/bin/sh

# backup
mkdir ~/dotfiles_backup 
mv ~/.config/nvim/ ~/.bash_profile ~/.gitconfig ~/.tmux.conf ~/.zshrc ~/dotfiles_backup

# make symlinks
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.dotfiles/nvim $XDG_CONFIG_HOME/nvim
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/psqlrc ~/.psqlrc
mkdir ~/.vimtmp
