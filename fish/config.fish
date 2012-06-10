##alias
#common
alias home 'cd ~'
alias lsa 'ls -a'
alias .. 'cd ..'
alias cd.. 'cd ..'
alias la 'ls -a'
alias vi 'vim'

#dayone
alias log "/Scripts/logtodayone.rb"
#dotfiles 
alias dotfiles 'cd ~/.dotfiles'
alias bashprofile 'screen -t bash_profile vi -O ~/.bash_profile ~/.dotfiles/bash/bash_alias'
alias screenrc 'screen -t screenrc vi ~/.screenrc'
alias vimrc 'screen -t vimrc vi ~/.vimrc'

alias mount_tatooine 'mount_smbfs //TATOOINE/Users/Bene/Pictures/Pictures/MP\ Navigator\ EX /Users/Bene/Pictures/scanner/'

#minecraft
alias mine_extract 'cd ~/Desktop/ ; mkdir mctmp ; cd mctmp ; jar xf ~/Library/Application\ Support/minecraft/bin/minecraft.jar'
alias mine_contract 'cd ~/Desktop/mctmp ; jar uf ~/Library/Application\ Support/minecraft/bin/minecraft.jar ./ ; cd .. ; rm -rf mctmp ; cd ..'
alias mine 'cd ~/Library/Application\ Support/minecraft/'


#git
alias gst 'git stat'
alias gstat 'git stat'
alias gitstat 'git stat'
alias gadd 'git add .'
alias gcmt 'git commit'
alias glg 'git log --pretty format:"%h %ad | %s%d" --graph --date short'
alias gp 'git push'
alias gpush 'git push'


#function console
#        switch $argv[(count $argv)]
#            case '-*'
#        tail -f /var/log/system.log     
#         case '*'
#    query= echo "$argv"|tr -s ' ' '|'
#    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
#        end  
#end
