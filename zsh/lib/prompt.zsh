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
if [[ $POWERLINE == "true" ]]
then
    SEGMENT_SEPARATOR=''
    GIT_UNSTAGED="●"
    GIT_STAGED="+"
    GIT_BRANCH=""
    ROOT_ICON="⚡"
    JOBS_ICON="⚙"
    ERROR_ICON="✘"
else
    SEGMENT_SEPARATOR='>'
    GIT_UNSTAGED='o'
    GIT_STAGED='+'
    GIT_BRANCH='b'
    ROOT_ICON='#'
    JOBS_ICON='J'
    ERROR_ICON='X'
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
        zstyle ':vcs_info:*' unstagedstr "$GIT_UNSTAGED"   # display this when there are unstaged changes
        zstyle ':vcs_info:*' stagedstr "$GIT_STAGED"  # display this when there are staged changes
        zstyle ':vcs_info:*' actionformats "$GIT_BRANCH %b %c%u <%a>"
        zstyle ':vcs_info:*' formats "$GIT_BRANCH %b %c%u"

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
        if [[ $(hostname -s) == "mail" ]]; then
            prompt_segment black default "%M"
        else
            prompt_segment black default "%m"
        fi
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
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$ERROR_ICON"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}$ROOT_ICON"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$JOBS_ICON"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

# Virtualenv: current working virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1
prompt_virtualenv() {
local virtualenv_path="$VIRTUAL_ENV"
if [[ -n $virtualenv_path ]]; then
    prompt_segment cyan default " $(basename $virtualenv_path)"
fi
}

prompt_btool() {
if [[ -v BTOOL_WORKSPACE_NAME ]]; then
    prompt_segment magenta black "$(echo $BTOOL_WORKSPACE_NAME)"
fi
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_btool
  prompt_virtualenv
  prompt_context
  prompt_dir
  promt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
