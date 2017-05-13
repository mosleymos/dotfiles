
source $HOME/zsh_modules/zsh_variables.zsh
source $HOME/zsh_modules/zsh_vim.zsh
source $HOME/zsh_modules/zsh_aliases.zsh

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
