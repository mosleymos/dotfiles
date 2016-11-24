
source $HOME/zsh_modules/zsh_variables.zsh
source $HOME/zsh_modules/zsh_vim.zsh
source $HOME/zsh_modules/zsh_aliases.zsh

setopt auto_cd 
cdpath=($HOME/Desktop $HOME/Documents $HOME/Images $HOME/Documents/coding_dojo $HOME/Desktop/Brouillon)

# Maybe to rethink
source $HOME/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
