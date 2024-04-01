#common
alias home='cd ~'
alias lsa='ls -a'
alias ös='ls'
alias la='ls -a'
alias ll='ls -l'
alias vi='nvim'
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
