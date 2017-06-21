"Config file from
"https://raw.githubusercontent.com/mcantor/no_plugins/master/no_plugins.vim
"youtube video https://youtu.be/XA2WjJbmmoM



"       HOW TO DO 90% OF WHAT PLUGINS DO (WITH JUST VIM)

"                          Max Cantor

"               NYC Vim Meetup -- August 3, 2016






" FEATURES TO COVER:
" - Fuzzy File Search
" - Tag jumping
" - Autocomplete
" - File Browsing
" - Snippets
" - Build Integration (if we have time)



" GOALS OF THIS TALK:
" - Increase Vim understanding
" - Offer powerful options

" NOT GOALS OF THIS TALK:
" - Hate on plugins
" - Get people to stop using plugins





" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on





" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags





" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list




" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" SNIPPETS:

" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)









" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
" set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back





"                          THANK YOU!

"                    Download this file at:
"                github.com/mcantor/no_plugins

"                Follow me for kitten pictures:
"                     twitter.com/mcantor

"          Contact me at `max at maxcantor dot net` for:
"                  - Consulting (Dev and PM)
"                          - Tutoring
"                     - Classroom Teaching
"                     - Internal Training
"                       - Encouragement

""" Configuration vim
""" Leader to Ctrl + s
""" leader to space we'll try that

let mapleader=<space>


""" Local language to us
""" setlocal spell spelllang=en_us

set ttyfast
set modelines=0
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

set undoreload=10000

set list
set laststatus=2

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


""" Source of a good vimrc
""" https://dougblack.io/words/a-good-vimrc.html

set scrolloff=5

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪

""" Ignore some files
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac   


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" Normal mapping
nnoremap <up> ddP<esc>
nnoremap <down> ddjp<esc>
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
""" Think about something like :.d2    -> delete 2 lines
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
""" ca se discute 
"nnoremap tn :tabnew<cr>


" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""" Insert mappings
inoremap jj <esc><c-r>
inoremap JJ <esc><c-r>
inoremap <up> ddP<nop>
inoremap <up> ddP<nop>
inoremap <up> ddP<nop>
inoremap <up> ddP<nop>
"""No tab remap to Ctrlp tab is used now for ultisnips
"""inoremap <Tab> <C-p>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Simple mappings
map Q <nop>
map <left> :echoe "Use h"<cr>
map <right> :echoe "Use l"<cr>
map <up> :echoe "Use k"<cr>
map <down> :echoe "Use j"<cr>
command! Q q "Bind Q to quit
command! Qall qall "Bind Q to quit
command! QA qall "Bind Q to quit


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Search documentation on zeal
""" Maybe think about the K key for modification 
nnoremap gz :!zeal "<cword>"&<CR><CR>
""" Abbreviations
""" Javascript abreviations
autocmd Filetype javascript :iabbrev <buffer> debug debugger
""" User de snippets pour ces abbreviations
"""autocmd Filetype javascript :iabbrev <buffer> log console.log()
"""autocmd Filetype javascript :iabbrev <buffer> todo //TODO:
"""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Ruby abreviations
autocmd Filetype ruby :iabbrev <buffer> debug puts "*"*22<esc>oputs "*"*22
autocmd Filetype ruby :iabbrev <buffer> debugger puts "*"*22<esc>oputs "*"*22
autocmd Filetype ruby :iabbrev <buffer> todo #TODO:

iabbrev mori keitamori@gmail.com iabbrev signature Date: <esc>:read !date<esc>o Author: KEITA Mori - keitamori@gmail.com


" Fuck you, help key.
noremap  <F1> :checktime<cr>
inoremap <F1> <esc>:checktime<cr>

""Resize

" Window Resizing {{{
" right/up : bigger
" left/down : smaller
nnoremap <ALT-right> :vertical resize +3<cr>
nnoremap <ALT-left> :vertical resize -3<cr>
nnoremap <ALT-up> :resize +3<cr>
nnoremap <ALT-down> :resize -3<cr>
" }}}

