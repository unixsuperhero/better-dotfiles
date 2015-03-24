
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
nnoremap ,s :w\|!git add %;git commit -m 'autocommitting %'<cr>
nnoremap ,q :wqa<cr>

nmap cop :set paste!<cr>       " works great in insert mode <C-o>cop


nmap <leader>u <Plug>(openbrowser-smart-search)
vmap <leader>u <Plug>(openbrowser-smart-search)
