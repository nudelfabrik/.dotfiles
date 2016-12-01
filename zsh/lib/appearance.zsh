# ls colors
autoload colors; colors;
#export LS_COLORS

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#setopt no_beep
setopt auto_cd
setopt multios

