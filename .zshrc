# TO separate to different files
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export EDITOR=vim
export VISUAL=vim
export MYVIMRC=/home/mori/.vimrc

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

# Some aliases
alias f=fg %1
alias ff=fg %2
alias fff=fg %3
alias pserver=python -m SimpleHTTPServer
alias home=cd $HOME

# To think about
#alias G=| grep

set -o vi

# Bind key jj to esc vi mode 
# src
# http://superuser.com/questions/351499/how-to-switch-comfortably-to-vi-command-mode-on-the-zsh-command-line
bindkey -M viins 'jj' vi-cmd-mode

# Maybe to rethink
source $HOME/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
