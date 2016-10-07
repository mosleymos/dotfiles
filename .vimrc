""" Separate concerns
source $HOME/.vim/config/vundle.vimrc
source $HOME/.vim/config/basic_configuration.vimrc
source $HOME/.vim/config/search.vimrc
source $HOME/.vim/config/normal_mappings.vimrc
source $HOME/.vim/config/insert_mappings.vimrc
source $HOME/.vim/config/mappings.vimrc
source $HOME/.vim/config/folding.vimrc
source $HOME/.vim/config/abbreviations.vimrc

""" Ctrlp <Change leader files>
let g:ctrlp_map = ',p'
let g:ctrlp_cmd = 'CtrlP'

""" Save when focus is lost always save everything wikia snippet to think about //  bad idea
autocmd FocusLost * :wa

""" Vimrc inspirations
""" https://dougblack.io/words/a-good-vimrc.html
