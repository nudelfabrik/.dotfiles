# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/zsh

echo -e "Welcome @ \c"; hostname -s
echo -e ""
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/games/bin:/opt/local/bin:/usr/local/sbin
if [[ $(uname) == "Darwin" ]]; then
    eval "$(ssh-agent)" >> /dev/null
    function cleanup {
        echo "Killing SSH-Agent"
        kill -9 $SSH_AGENT_PID
    }
    trap cleanup EXIT
fi

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Load and run compinit
autoload -U compinit
compinit -i

setopt CORRECT
