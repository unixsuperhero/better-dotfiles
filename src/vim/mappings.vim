
" set mapleader to space, unset it later

let mapleader=' '

" tmp/vimrc

" tmp/vimrc.local

nmap gf :vert wincmd f<CR>
nmap gF :vert wincmd F<CR>

nmap <leader>z :call <SID>SynStack()<CR>

nmap ,p :!rspec --format=progress %<cr>
nmap ,f :!rspec %<cr>
nmap ,l :exec("!rspec %:" . line("."))<cr>

" tmp/vimrc.josh

nnoremap gf :vs <cfile><CR>
nnoremap  :vert stjump<CR>
vnoremap < <gv  " visual shifting (does not exit Visual mode)
vnoremap > >gv
nnoremap > >>
nnoremap < <<
nnoremap j gj
nnoremap k gk
nnoremap K kJ
nnoremap ,c :vert wincmd <C-]><CR>
nnoremap ,f :CommandT<cr>
nnoremap ,q :wqa<cr>

nmap cop :set paste!<cr>            " works great in insert mode <C-o>cop<c-u><esc>
nmap com :set modifiable!<cr>

" leader mappings
nmap <leader>; :
nmap <leader><leader> :
nmap <leader>w :w<cr>
nmap <leader>e :e<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
nmap <leader>l :ls<cr>
nnoremap <leader>s :w\|exe("!cd %:p:h; git add %:t; git commit -m 'autocommitting %:t'")<cr>
nmap <leader>c :w !pbcopy<cr>
nmap <leader>p :.!pbpaste<cr>

nmap <leader>m :set mp?<cr>
nmap <leader>M :make<cr>
nmap <leader><c-m> :set mp=

nmap <leader>k :set mp?<cr>
nmap <leader>K :make<cr>
nmap <leader><c-k> :set mp=

nmap <leader>! yyp!!sh<cr>

nmap <leader>u <Plug>(openbrowser-smart-search)
vmap <leader>u <Plug>(openbrowser-smart-search)


" set mapleader to a comma (,) not a space

let mapleader=','

