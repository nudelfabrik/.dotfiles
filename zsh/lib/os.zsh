# Mac specifics
if [[ $(uname) == "Darwin" ]]; then
    alias f='open -a Finder ./'
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
    alias drill='dig'
    #export SSH_AUTH_SOCK="$(brew --prefix)/var/run/yubikey-agent.sock"
    eval $(keychain --eval --noinherit -q)
fi

# Powerline env
if [[ $(uname) == "Darwin" ]] || [[ -z "$SSH_CLIENT" ]] ; then
    export POWERLINE=true
fi

# FreeBSD specifics
if [[ $(uname) == "FreeBSD" ]]; then
    alias pfreload='sudo pfctl -f /etc/pf.conf'
    alias dig='drill'
fi

# Linux
if [[ $(uname) == "Linux" ]]; then
    export SHELL=/usr/bin/zsh
    export PATH=$PATH:$HOME/.local/bin
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi
