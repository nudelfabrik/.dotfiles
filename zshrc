# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/zsh

echo -e "Welcome @ \c"; hostname -s
echo -e ""
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/games/bin:/opt/local/bin:/usr/local/sbin:/usr/local/go/bin
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

export GOPATH=$HOME/Developer/go
export PATH=$PATH:$GOPATH/bin
export LANG=en_US.UTF-8

export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Custom autocorrects
compdef ping6=ping
compdef doas=sudo

setopt CORRECT
