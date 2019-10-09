# Mac specifics
if [[ $(uname) == "Darwin" ]]; then
    alias f='open -a Finder ./'
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
    alias drill='dig'
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

# pip for unix OS, where user is bene
if [[ $(uname) != "Darwin" ]]; then
    export PATH=$PATH:/home/bene/.local/bin
fi
