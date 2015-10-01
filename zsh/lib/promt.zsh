# autoload -U add-zsh-hook
autoload -Uz vcs_info

# # enable VCS systems you use
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*:prompt:*' check-for-changes true

setopt prompt_subst
autoload -U promptinit
promptinit


### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

CURRENT_BG='NONE'
if [[ $TERM == "screen-256color" ]] || [[ $TERM == "xterm-256color" ]]
then
    SEGMENT_SEPARATOR=''
else
    SEGMENT_SEPARATOR='>'
fi

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

promt_git() {
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        local repo_path=$(git rev-parse --git-dir 2>/dev/null)

        if [[ -e "${repo_path}/BISECT_LOG" || \
              -e "${repo_path}/MERGE_HEAD" || \
              -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
            prompt_segment red black
        else  
            if [[ -n $(git status -s 2> /dev/null) ]];
            then
                prompt_segment yellow black
            else
                prompt_segment blue black
            fi
        fi
        # Look at http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
        # for mor options
        zstyle ':vcs_info:*' check-for-changes true
        zstyle ':vcs_info:*' unstagedstr '●'   # display this when there are unstaged changes
        zstyle ':vcs_info:*' stagedstr '+'  # display this when there are staged changes
        zstyle ':vcs_info:*' actionformats ' %b %c%u <%a>'
        zstyle ':vcs_info:*' formats ' %b %c%u'

        vcs_info

      echo -n  "${vcs_info_msg_0_}"
  fi
}
### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ -n "$SSH_CLIENT" ]]; then
  prompt_segment black default "%m"
  fi
}

prompt_dir() {
  prompt_segment green black '%~'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_context
  prompt_dir
  promt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
