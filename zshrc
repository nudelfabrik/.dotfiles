# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

echo -e "Welcome @ \c"; hostname -s
echo -e ""
ddate
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/games/bin:/opt/local/bin:~/Library/Haskell/bin:/usr/local/sbin

#export TERM="xterm"
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"
DEFAULT_USER="Bene"
setopt CORRECT
# Autostart tmux
ZSH_TMUX_AUTOSTART="true"

if [[ $(uname) == "FreeBSD" ]]; then
    ZSH_THEME="candy"
    ZSH_TMUX_AUTOSTART="false"
fi

if [ -n "$SSH_CONNECTION" ]; then 
    ZSH_THEME="frisk"
    ZSH_TMUX_AUTOSTART="false"
fi

#
# teamocil autocomplete
compctl -g '~/.teamocil/*(:t:r)' teamocil

# Zsh Settings
#
# Customize to your needs...

# Set to this to use case-sensitive completion
#  CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn brew forklift osx tmux )
source $ZSH/oh-my-zsh.sh

source ~/.dotfiles/zsh_alias
source ~/.dotfiles/zsh_funct
