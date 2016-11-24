
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
