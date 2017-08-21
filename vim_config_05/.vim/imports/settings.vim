"Config file from
"https://raw.githubusercontent.com/mcantor/no_plugins/master/no_plugins.vim
"youtube video https://youtu.be/XA2WjJbmmoM
set nocompatible
set path+=**
set wildmenu
set wildmode=full:list

set complete=.,w,b,u,t,i


""" Local language to us
" setlocal spell spelllang=en_us

set ttyfast
set modelines=0
set number
set numberwidth=5
set ruler
set title
set encoding=utf-8
set history=5000
set visualbell
set noerrorbells

set statusline=%f
set statusline+=%=
set statusline+=%y
set statusline+=%l
set statusline+=/
set statusline+=%L

set undoreload=10000
set formatoptions=qrn1

set list
set laststatus=2

set wrap

set mouse=a
set mousemodel=popup

colorscheme blackboard

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
set pastetoggle=<F5>

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


""" This file manage searching in vim
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Antialias -> works on mac os
set antialias
set background=dark

""" Source of a good vimrc
""" https://dougblack.io/words/a-good-vimrc.html
set scrolloff=5
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set dictionary=/usr/share/dict/words
set backupskip=/tmp/*,/private/tmp/*"
set tags+=~/.vim/tags/

""" Vim cursor different between mode
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor+=i:ver100-iCursor
set guicursor+=n:blinkon0
set guicursor+=i:blinkwait10

let mapleader=' '

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
