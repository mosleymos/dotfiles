
" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back


let mapleader=" "

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

""" Reouvrir un fichier au dernier endroit ou il fut édité et enregister
""" les dossiers
""" url : http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session



" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
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

