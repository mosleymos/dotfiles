
""" Normal mapping
nnoremap <up> ddP<esc>
nnoremap <down> ddjp<esc>
""" Not a good fit with easymotion which uses space space
""" nnoremap <space><space> vwhh
nnoremap j gj
nnoremap gj j 
nnoremap k gk
nnoremap gk k

""" French keyboard go to right
nnoremap m l<esc>


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
nnoremap <Leader>h :nohl<cr>b

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

nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

nnoremap o o<esc>
nnoremap O O<esc>


nnoremap , :
""" Settings search and move
nnoremap / /\v

""" Delete
nnoremap D dd<cr>

""" Save like windows
nnoremap <C-s> :w<cr>

""" Correct copy and paste of a word with buffers a revoir
"nnoremap yw "ayw<cr>
"nnoremap <leader>p "aP<cr>

""" New tab
""" ca se discute 
"nnoremap tn :tabnew<cr>

""" Search documentation on zeal
""" Maybe think about the K key for modification 
nnoremap gz :!zeal "<cword>"&<CR><CR>

""" I don't know how to correctly use the vim macro functions so disable it

nnoremap q <nop>
