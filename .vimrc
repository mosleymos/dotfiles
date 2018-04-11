""Basic vim configuration"
""" Separate concerns

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



""" This file manage searching in vim
set hlsearch
set incsearch
set ignorecase
set smartcase

""" Search documentation on zeal
""" Maybe think about the K key for modification 
nnoremap gz :!zeal "<cword>"&<CR><CR>


"""Normal mapping - gestion 
""" Normal mapping
nnoremap <up> ddP<esc>
nnoremap <down> ddjp<esc>
nnoremap <space><space> vwhh
nnoremap j gj
nnoremap k gk
let g:tmux_navigator_no_mappings = 1

""" nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
""" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
""" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
""" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
""" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

""" nnoremap <C-h> <C-w>h :vertical resize 85<cr>
""" nnoremap <C-j> <C-w>j :vertical resize 85<cr>
""" nnoremap <C-k> <C-w>k :vertical resize 85<cr>
""" nnoremap <C-l> <C-w>l :vertical resize 85<cr>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <BS> cb<esc>h 

""" Aucune information recherchée
nnoremap K <nop>

""" Shut down the hl search
nnoremap <Leader>h :nohl<cr>

nnoremap cc c2w
nnoremap ccc c3w

""" Delete lines below
nnoremap dj dd
nnoremap djj dddd
nnoremap djjj dddddd
nnoremap djjjj  dddddddd

""" Delete lines above
nnoremap dkk kkdddd
nnoremap dkkk kkkdddddd
nnoremap dkkkk kkkkdddddddd

""" Choose a word
nnoremap <space> vw<cr>

"""No use of dd
nnoremap <Leader>d dd

""" Edit our vimrc on demand
nnoremap <leader>ev :vsplit ~/.vimrc<cr>

""" Reload our vimrc on demand
nnoremap <leader>sv :source ~/.vimrc<cr>

""" Parantheses in word hardcore from :http://learnvimscriptthehardway.stevelosh.com/chapters/09.html
""" Make a word between quotes

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>ce viw<esc>a]<esc>hbi[<esc>lel
nnoremap <leader>cp viw<esc>a)<esc>hbi(<esc>lel

""" Wrap a text in parantheses after selection
""""TODO create mapping

""" go to specific line  g22  <=> 22G
 
""" Delete
nnoremap D dd<cr>

""" Save like windows
nnoremap <C-s> :w<cr>

""" New tab
nnoremap tn :tabnew<cr>


""" Insert mappings
inoremap jj <esc><c-r>
inoremap JJ <esc><c-r>
inoremap <up> ddP<nop>
inoremap <up> ddP<nop>
inoremap <up> ddP<nop>
inoremap <up> ddP<nop>
"""No tab remap to Ctrlp tab is used now for ultisnips
"""inoremap <Tab> <C-p>

""" Simple mappings
map Q <nop>
map <left> :echoe "Use h"<cr>
map <right> :echoe "Use l"<cr>
map <up> :echoe "Use k"<cr>
map <down> :echoe "Use j"<cr>


command! Q q "Bind Q to quit
command! Qall qall "Bind Q to quit
command! QA qall "Bind Q to quit






""" Manage folding in vim

set foldmethod=indent
set foldnestmax=3

nnoremap <space> za
nnoremap <leader><space> zc





""" Abbreviations
""" Javascript abreviations
autocmd Filetype javascript :iabbrev <buffer> debug debugger
""" User de snippets pour ces abbreviations
"""autocmd Filetype javascript :iabbrev <buffer> log console.log()
"""autocmd Filetype javascript :iabbrev <buffer> todo //TODO:
"""

""" Ruby abreviations
autocmd Filetype ruby :iabbrev <buffer> debug puts "*"*22<esc>oputs "*"*22
autocmd Filetype ruby :iabbrev <buffer> debugger puts "*"*22<esc>oputs "*"*22
autocmd Filetype ruby :iabbrev <buffer> todo #TODO:

iabbrev mori keitamori@gmail.com iabbrev signature Date: <esc>:read !date<esc>o Author: KEITA Mori - keitamori@gmail.com



"""" Task manager basic in vim ??? 
"""Wip
nnoremap <leader>t :sp $HOME/Documents/tasks.md<cr>


source $HOME/.vim/config/tasks.vimrc

"""***********************************
""" Ctrlp Configuration
""" Ctrlp <Change leader files>
let g:ctrlp_map = ',p'
let g:ctrlp_cmd = 'CtrlP'
"""***********************************

"""***********************************
"""ultisnips configuration

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
"""Default
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


"""***********************************

"""***********************************
""" Save when focus is lost always save everything wikia snippet to think about //  bad idea
autocmd FocusLost * :wa
"""***********************************


"""***********************************
""" Vimrc inspirations
""" https://dougblack.io/words/a-good-vimrc.html
""" An article about vim relative number vs absolute number
""" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
""" http://naleid.com/blog/2010/10/04/vim-movement-shortcuts-wallpaper
""" Vim shortcut wallpaper

""" Think about relative and absolute number
:au FocusLost * :set number
:au FocusGained * :set relativenumber

""" Neocomplete configuration

""""Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

