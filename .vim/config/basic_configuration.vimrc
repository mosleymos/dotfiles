""" Configuration vim
""" Leader to Ctrl + s
let mapleader=','

syntax enable

""" Local language to us
""" setlocal spell spelllang=en_us

set number
set numberwidth=5
set ruler
set title
set encoding=utf-8
set history=5000

set statusline=%f
set statusline+=%=
set statusline+=%y
set statusline+=%l
set statusline+=/
set statusline+=%L


set laststatus=2

set wildmode=full:list
set wrap

set mouse=a
set mousemodel=popup

colorscheme default 

set showcmd
set showmatch
set hidden
set lazyredraw
set autoindent
set smarttab
set expandtab
set textwidth=80
set colorcolumn=+1
set tabstop=2
set softtabstop=2
set cursorline

set shiftwidth=2
set shiftround

set nojoinspaces
set foldenable
set confirm
set pastetoggle=<F2>

""" Backspace experimentation
set backspace=indent,eol,start

set gdefault

set cmdheight=2

""" No swapfile, backup or file writing
set nobackup
set noswapfile
set nowb

set autoread
set autowrite

""" splits
set splitright
set splitbelow
""" Split management
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

""" Source of a good vimrc
""" https://dougblack.io/words/a-good-vimrc.html

set scrolloff=5
set nocompatible

