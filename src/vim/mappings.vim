
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

" hero

" Hero Notes

nnoremap <leader>hns !!note save<cr>
nnoremap <leader>hnm onnoremap <leader<c-v>>hncx o #tags #go #here<esc<c-v>>0i<esc>
nnoremap <leader>hnm o:nnoremap <leader<c-v>>hncx o #start_typing_a_tag<esc<c-v>>0i<esc>0fsve<c-g>

nnoremap <leader>hncp o #hero #h #todo #projectfile<esc>0i
nnoremap <leader>hncn o #hero #todo #notes<esc>0i
