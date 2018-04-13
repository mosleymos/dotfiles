
# Some aliases
alias f=fg %1
alias ff=fg %2
alias fff=fg %3
alias pserver=python -m SimpleHTTPServer
alias home=cd $HOME

# To think about
#alias G=| grep

# TO separate to different files
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export EDITOR=vim
export VISUAL=vim
export MYVIMRC=/home/mori/.vimrc
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'


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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
