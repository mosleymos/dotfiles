""" This file manage searching in vim
set hlsearch
set incsearch
set ignorecase
set smartcase

""" Search documentation on zeal
""" Maybe think about the K key for modification 
nnoremap gz :!zeal "<cword>"&<CR><CR>
