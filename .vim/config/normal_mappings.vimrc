""" Normal mapping
nnoremap <up> ddP<esc>
nnoremap <down> ddjp<esc>
nnoremap <space><space> vwhh
nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h :vertical resize 85<cr>
nnoremap <C-j> <C-w>j :vertical resize 85<cr>
nnoremap <C-k> <C-w>k :vertical resize 85<cr>
nnoremap <C-l> <C-w>l :vertical resize 85<cr>

nnoremap <BS> cb<esc>h 

""" Aucune information recherchée
nnoremap K <nop>

""" Shut down the hl search
nnoremap <Leader>/ :nohl<cr>

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

""" Wrap a text in parantheses after selection
""""TODO create mapping

""" go to specific line  g22  <=> 22G
 
