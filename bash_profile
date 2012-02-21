export PS1="\[\e[0;33m\]\$ \[\e[0;32m\]\w: \[\e[0m\]"

echo -e "Welcome on Triple Zero"
echo -e ""
echo -e "Today is "; date

#source
source ~/.git-completion.bash
source ~/.bash_alias


# console
function console () {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}


