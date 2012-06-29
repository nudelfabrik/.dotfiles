Dotfiles README
===============

## Installation:

1. save old files
   * `mkdir ~/backup | mv ~/.bash_profile ~/.vim ~/.vimrc ~/.screenrc backup`
2. get this repository from github 
    * `mkdir ~/.dotfiles | cd ~/.dotfiles | git clone git@github.com:nudelfabrik/.dotfiles.git`

3. symlinks
    * `ln -s ~/.dotfiles/bash_profile ~/.bash_profile`
    * `ln -s ~/.dotfiles/vim ~/.vim`
    * `ln -s ~/.dotfiles/vimrc ~/.vimrc`
    * `ln -s ~/.dotfiles/gitconfig ~/.gitconfig`
    * `ln -s ~/.dotfiles/screenrc ~/.screenrc`
    * `mkdir ~/.vimtmp`

## LIST OF FILES
* bash_profile
* Bash/
    * bash_alias
    * bash_function
    * git-complete.bash
* vim/
* vimrc
* gitconfig
* screenrc
