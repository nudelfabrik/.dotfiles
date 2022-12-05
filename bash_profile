export PS1="\[\e[0;33m\]> \[\e[0;32m\]\w: \[\e[0m\]"
if [ -n "$SSH_CLIENT" ]; then 

    export PS1="\[\e[0;31m\]\u@\h\[\e[0;33m\]> \[\e[0;32m\]\w: \[\e[0m\]"

fi
export PS2="\[\e[0;33m\]>"
PATH=$PATH:/usr/games/bin/
export PATH
export TERM="xterm-256color"
echo -e "Welcome on "; hostname
echo -e ""
echo -e "Today is "; date

# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


#common
alias home='cd ~'
alias lsa='ls -a'
alias ..='cd ..'
alias cd..='cd ..'
alias la='ls -a'
alias vi='vim'

#git
alias gst='git stat'
alias gstat='git stat'
alias gitstat='git stat'
alias gadd='git add .'
alias gcmt='git commit'
alias gp='git push'
alias gpush='git push'

export PATH=/usr/local/bin:$PATH
