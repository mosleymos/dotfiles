" No plugin in vim notes to see 
"https://raw.githubusercontent.com/mcantor/no_plugins/master/no_plugins.vim


""Basic vim configuration"
""" Separate concerns

""" Configuration vim
""" Leader to Ctrl + s
""" Leader to Space

" Local config or autocommand to think
""if filereadable($HOME . "/.vimrc.local")
""  source ~/.vimrc.local
""endif

let mapleader=' '

syntax enable
filetype plugin on
filetype indent on

""" Local language to us
""" setlocal spell spelllang=en_us

set ttyfast

set toolbar=icons,text

set number
set numberwidth=5
set ruler
set title
set encoding=utf-8
set history=5000

set modelines=0

set statusline=%f
set statusline+=%=
set statusline+=%y
set statusline+=%l
set statusline+=/
set statusline+=%L


set laststatus=2

set wildmode=full:list
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set wrap

set mouse=a
set mousemodel=popup

set complete=.,w,b,u,t,i
set completeopt=menu,longest

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

set backupskip=/tmp/*,/private/tmp/*"


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

set path+=**

set wildmenu

""" This file manage searching in vim
set hlsearch
set incsearch
set ignorecase
set smartcase

set shell=bash

set foldmethod=indent
set foldnestmax=3

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Always use vertical diffs
set diffopt+=vertical


""" Gvim or options otehers

if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions-=m
    colo badwolf
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
else
    set t_Co=256
    colorscheme default 
endif

""" Search documentation on zeal
""" Maybe think about the K key for modification 
nnoremap gz :!zeal "<cword>"&<CR><CR>


"""Normal mapping - gestion 
""" Normal mapping
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <space><space> vwhh
nnoremap j gj
nnoremap k gk

""" nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
""" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
""" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
""" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
""" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

""" nnoremap <C-h> <C-w>h :vertical resize 85<cr>
""" nnoremap <C-j> <C-w>j :vertical resize 85<cr>
""" nnoremap <C-k> <C-w>k :vertical resize 85<cr>
""" nnoremap <C-l> <C-w>l :vertical resize 85<cr>

nnoremap <C-h> <C-w>h :vertical resize 85<cr>
nnoremap <C-j> <C-w>j :vertical resize 85<cr>
nnoremap <C-k> <C-w>k :vertical resize 85<cr>
nnoremap <C-l> <C-w>l :vertical resize 85<cr>

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

"""Remap  in normal mode mm to A
""" clavier francais  essai en cours
""nnoremap mm Ah
nnoremap mm A

""" sauter a la ligne 
nnoremap o o<esc> 
nnoremap O O<esc>


" Thanks to Steve Losh for this liberating tip
" " See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

""" New tab
"""nnoremap tn :tabnew<cr>

""" Insert mappings
inoremap jj <esc><c-r>
inoremap JJ <esc><c-r>

"""No tab remap to Ctrlp tab is used now for ultisnips
"""inoremap <Tab> <C-p>

""" no backs
inoremap <BS> <NOP>

""" Simple mappings
map Q <nop>
map <left> :echoe "Use h"<cr>
map <right> :echoe "Use l"<cr>
map <up> :echoe "Use k"<cr>
map <down> :echoe "Use j"<cr>


command! MakeTags !ctags -R .

command! Q q "Bind Q to quit
command! Qall qall "Bind Q to quit
command! QA qall "Bind Q to quit


""" Manage folding in vim

nnoremap <space> za
nnoremap <leader><space> zc

"""Go to definition from a tags
"""it"s not a good solution"
"""nnoremap <C-S-j> <C-]>
"""nnoremap <C-S-k> <C-T>
nnoremap <LeftMouse> <C-]>
nnoremap <RightMouse> <C-T>

""" I don't know how to correctly use the vim macro functions so disable it
nnoremap q <nop>

""" Visual mode mappings

vnoremap mm <esc><cr>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


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
""nnoremap <leader>t :sp $HOME/Documents/tasks.md<cr>


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
"":au FocusLost * :set number
"":au FocusGained * :set relativenumber

autocmd FocusLost * :set number
autocmd FocusGained * :set nonumber 

set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
if line("'\"") <= line("$")
  normal! g`"
    return 1
    endif
    endfunction

  augroup resCur
autocmd!
autocmd BufWinEnter * call ResCur()
augroup END

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"" set omnifunc for autocompletion

"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.

"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim


""" Yellow visual selection to think"""
highlight Visual cterm=bold ctermbg=Yellow ctermfg=NONE


"""Plug configuration
""" Plusieurs elements à revoir mais tenter 
""" Des essais

call plug#begin('~/.vim/plugged/')

Plug 'MaxSt/FlatColor'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/vim-auto-save'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-syntastic/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'jpalardy/vim-slime'
Plug 'christoomey/vim-tmux-runner'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/unite.vim'
Plug 'ggVGc/vim-fuzzysearch'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'

""" Plugin a revoir et repenser
""" Plug 'haya14busa/incsearch-fuzzy.vim'
"""Plug 'jpalardy/vim-slime'


call plug#end()
""" Flat colors configuration

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
""" LIGHTLINE CONFIGURATION
let g:lightline = { 'colorscheme': 'flatcolor' }

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""

""" VIM AUTOSAVE PLUGIN CONFIGURATION
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
"" let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
""" VIM EASYMOTION CONFIGURATION
"" Let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <leader>h <plug>(easymotion-linebackward)

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM MULTIPLE CURSORS PLUGIN 

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>' 

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM TMUX RUNNER PLUGIN 
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

nnoremap <leader>! :VtrSendLinesToRunner<cr>
vnoremap <leader>! :VtrSendLinesToRunner<cr>
"
"" Think about some send automatically
" About this binding at http://codefor.life/vim-tmux-runner/
"    nnoremap <leader>va :VtrAttachToPane<cr>
"    nnoremap <leader>ror :VtrReorientRunner<cr>
"    nnoremap <leader>sc :VtrSendCommandToRunner<cr>
"    nnoremap <leader>or :VtrOpenRunner<cr>
"    nnoremap <leader>kr :VtrKillRunner<cr>
"    nnoremap <leader>fr :VtrFocusRunner<cr>
"    nnoremap <leader>dr :VtrDetachRunner<cr>
"    nnoremap <leader>cr :VtrClearRunner<cr>
"    nnoremap <leader>fc :VtrFlushCommand<cr>
"    nnoremap <leader>sf :VtrSendFile<cr>

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
""" VIM BOOKMARKS MANAGER
""" mapping to rethink about
"""nmap <Leader>b <Plug>BookmarkToggle
"""nmap <Leader>i <Plug>BookmarkAnnotate
"""nmap <Leader>a <Plug>BookmarkShowAll
"""nmap <Leader>j <Plug>BookmarkNext
"""nmap <Leader>k <Plug>BookmarkPrev

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM CTRLP PLUGIN 
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

""Fuzzy find" from stack overflow
"""https://superuser.com/questions/390011/fuzzy-find-within-file-in-vim
""" TO thiink about
"""let g:ctrlp_cmd = 'CtrlPLastMode'
"""let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

""set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"" let g:ctrlp_custom_ignore = {
""   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
""   \ 'file': '\v\.(exe|so|dll)$',
""   \ 'link': 'some_bad_symbolic_links',
""   \ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
""""""let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM TAGBAR PLUGIN 
nmap <F8> :TagbarToggle<CR>

""" VIM FUZZYSEARCH PLUGIN 

let g:fuzzysearch_match_spaces = 1
let g:fuzzysearch_prompt = 'fuzzy /'
let g:fuzzysearch_hlsearch = 1
let g:fuzzysearch_ignorecase = 1
let g:fuzzysearch_max_history = 30

nnoremap / :FuzzySearch<cr>


""" VIM AUTOTAG PLUGIN
let g:autotagTagsFile=".tags"


"""  VIm Ultisnips and Snipmate plugin

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""UNITE VIM PLUGIN 
" -------------------------------------------------------------------------------
" -------------------------------------------------------------------------------

"" let g:unite_source_history_yank_enable = 1
"" let g:unite_data_directory='~/.vim/.cache/unite'
"" let g:unite_source_rec_max_cache_files=50000
"" let g:unite_enable_start_insert = 1
"" let g:unite_split_rule = "botright"
"" let g:unite_force_overwrite_statusline = 0
"" let g:unite_winheight = 10
"" 
"" 
"" " fuzzy matcher and sort everything
"" call unite#filters#matcher_default#use(['matcher_fuzzy'])
"" call unite#filters#sorter_default#use(['sorter_rank'])
"" 
"" 
"" nnoremap <leader><leader>b :Unite buffer<cr>
"" nnoremap <leader><leader>f :Unite file_rec<cr>


""" Autocomplete script
""" From http://vim.wikia.com/wiki/VimTip566
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"


"""VIM SLIME PLUGIN 
"""let g:slime_target = "tmux"
"""let g:slime_paste_file = "$HOME/.slime_paste"
"""" or maybe...
"""let g:slime_paste_file = tempname()


"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM INCSEARCH FUZZY PLUGIN 

""" map z/ <Plug>(incsearch-fuzzy-/)
""" map z? <Plug>(incsearch-fuzzy-?)
""" map zg/ <Plug>(incsearch-fuzzy-stay)

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM SYNTASTIC PLUGIN CONFIGURATION
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
"""set statusline+=%*
"""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM NERDTREE PLUGIN 

map <C-e> :NERDTreeToggle<CR>

