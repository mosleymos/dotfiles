" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

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


""" Plugin a revoir et repenser
""" Plug 'haya14busa/incsearch-fuzzy.vim'
"""Plug 'jpalardy/vim-slime'




call plug#end()
""" Flat colors configuration

if has('patch-7.4.1778')
  set guicolors
endif
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
map <Leader>h <Plug>(easymotion-linebackward)

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

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM CTRLP PLUGIN 
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

""set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"" let g:ctrlp_custom_ignore = {
""   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
""   \ 'file': '\v\.(exe|so|dll)$',
""   \ 'link': 'some_bad_symbolic_links',
""   \ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""
"""VIM TAGBAR PLUGIN 
nmap <F8> :TagbarToggle<CR>


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
"""set statusline+=%#warningmsg#
"""set statusline+=%{SyntasticStatuslineFlag()}
"""set statusline+=%*
"""
"""let g:syntastic_always_populate_loc_list = 1
"""let g:syntastic_auto_loc_list = 1
"""let g:syntastic_check_on_open = 1
"""let g:syntastic_check_on_wq = 0

