#!/usr/bin/env zsh
#
# Some aliases
alias f='fg %1'
alias ff='fg %2'
alias fff='fg %3'
alias pserver='python -m SimpleHTTPServer'
alias home=cd $HOME

alias la="ls -a"
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
alias sl='ls'
alias ..='cd ..'
alias ...='cd ../..'

alias grep='grep --color=auto'
alias -g G=' | grep '

alias be='bundle exec'

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# To think about
#alias G=| grep

# TO separate to different files
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export EDITOR=vim
export VISUAL=vim
export MYVIMRC=/home/mori/.vimrc
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'

cdpath=($HOME/Documents $HOME/Images $HOME/Pictures $HOME/Documents/coding_dojo $HOME/Desktop/Brouillon)


export HISTIGNORE="cd_*"

HISTFILE=~/.zsh/histfile
HISTSIZE=5000
SAVEHIST=5000

	setopt append_history
	setopt share_history  # partage de l'historique
	setopt inc_append_history


set -o vi

# Bind key jj to esc vi mode 
# src
# http://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line
bindkey -M viins 'jj' vi-cmd-mode
# Other good configuration
# Taken from http://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode/156204#156204 

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


setopt auto_cd


cdpath=($HOME/Desktop $HOME/Documents $HOME/Images $HOME/Documents/coding_dojo $HOME/Desktop/Brouillon)

# Maybe to rethink
source $HOME/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.rbenv/bin:$PATH"
export HISTIGNORE="cd_*"

eval "$(rbenv init -)"

PS1=${(j::Q)${(Z:Cn:):-$'
%F{cyan}[%f
%(!.%F{red}%n%f.%F{green}%n%f)
%F{cyan}@%f
${p_host}
%F{cyan}][%f
%F{blue}%~%f
%F{cyan}]%f
%(!.%F{red}%#%f.%F{green}%#%f)
" "
'}}

PS2=$'%_>'
RPROMPT=$'${vcs_info_msg_0_}'

# Inspiration zsh du gist https://gist.github.com/clementbethuys/897125

fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_white=%{$'\e[0;37m'%}	

fg_gray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}


# Afficher branche from
# https://askubuntu.com/questions/85088/git-branch-in-zsh-prompt
autoload -Uz vcs_info
precmd () { vcs_info  }
setopt prompt_subst

PROMPT="${fg_brown}${fg_green}%n${fg_red}@${fg_purple}%m${fg_black}[${fg_blue}%~${fg_black}]\$vcs_info_msg_0_
${fg_brown}${fg_lgreen}[${fg_cyan}%T${fg_lgreen}]: ▶ "

#Look in history
bindkey '^R' history-incremental-search-backward
bindkey "^S" history-incremental-pattern-search-forward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh configuration à voir - emprunt à faire
# https://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/
# https://github.com/myfreeweb/zshuery
# https://github.com/spicycode/ze-best-zsh-config
# https://geekeries.org/2016/03/installer-et-configurer-zsh-sur-debian-8/
