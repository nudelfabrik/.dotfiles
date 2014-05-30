#common
alias home='cd ~'
alias lsa='ls -a'
alias ös='ls'
alias la='ls -a'
alias vi='vim'
alias rmr='rm -r'
alias -g ulb='/usr/local/bin'
alias tree='tree -C -L 2'

#distribute current path via http port 1138
alias serve='python -m SimpleHTTPServer 1138'

#dotfiles 
alias dotfiles="cd ~/.dotfiles"

#git
alias gst='git stat'
alias gstat='git stat'
alias gitstat='git stat'
alias gadd='git add .'
alias gcmt='git commit'
#alias glg='git log --pretty=format:"%h %ad | %s%d" --graph --date=short'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset - %Cgreen%an%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %Creset' --abbrev-commit --date=short"
#alias glg='git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --'
alias gp='git push'
alias gpush='git push'

# Mac specifics
if [[ $(uname) == "Darwin" ]]; then
    alias f='open -a Finder ./'
    alias uni='cd ~/Documents/Uni/Semester'
    alias wakeup="wakeonlan 94:de:80:9a:18:51"
    alias sleepnow="osascript -e 'tell application \"System Events\" to sleep'"
    alias t='todo.sh'
    alias gotot='cd /Users/Bene/Dropbox/Sync/Todo'

    #minecraft
    alias mine_extract='cd ~/Desktop/ ; mkdir mctmp ; cd mctmp ; jar xf ~/Library/Application\ Support/minecraft/bin/minecraft.jar'
    alias mine_contract='cd ~/Desktop/mctmp ; jar uf ~/Library/Application\ Support/minecraft/bin/minecraft.jar ./ ; cd .. ; rm -rf mctmp ; cd ..'
    alias mine='cd ~/Library/Application\ Support/minecraft/'

    alias neth='tmux -L nethack -c /usr/games/bin/nethack'
    
    #terpstra
    alias log="/Scripts/logtodayone.rb"
    alias marked="open -a Marked.app"
fi

# FreeBSD specifics
if [[ $(uname) == "FreeBSD" ]]; then
    alias pfreload='sudo pfctl -f /etc/pf.conf'
fi
