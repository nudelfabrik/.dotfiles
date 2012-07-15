export PS1="\[\e[0;33m\]\$ \[\e[0;32m\]\w: \[\e[0m\]"
export PS2="\[\e[0;33m\]>"
echo -e "Welcome on \c"; hostname -s
echo -e ""
echo -e "Today is "; date
#source
source ~/.dotfiles/bash/git-completion.bash
source ~/.dotfiles/bash/bash_alias
source  ~/.dotfiles/bash/bash_function
