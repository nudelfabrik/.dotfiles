# Mac specifics
if [[ $(uname) == "Darwin" ]]; then
    alias f='open -a Finder ./'
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
fi

# Powerline env
if [[ $(uname) == "Darwin" ]] || [[ -z "$SSH_CLIENT" ]] ; then
    export POWERLINE=true
fi

# FreeBSD specifics
if [[ $(uname) == "FreeBSD" ]]; then
    alias pfreload='sudo pfctl -f /etc/pf.conf'
fi