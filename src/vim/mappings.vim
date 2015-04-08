
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

nmap cop :set paste!<cr>       " works great in insert mode <C-o>cop<c-u><esc>

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

nmap <leader>! yyp!!sh<cr>

nmap <leader>u <Plug>(openbrowser-smart-search)
vmap <leader>u <Plug>(openbrowser-smart-search)

" hero

" Hero Notes

nnoremap <leader>hns !!note save<cr>
nnoremap <leader>hnm onnoremap <leader<c-v>>hncx o #tags #go #here<esc<c-v>>0i<esc>
nnoremap <leader>hnm o:nnoremap <leader<c-v>>hncx o #start_typing_a_tag<esc<c-v>>0i<esc>0fsve<c-g>

nnoremap <leader>hncp o #hero #h #todo #projectfile<esc>0i
nnoremap <leader>hncn o #hero #todo #notes<esc>0i


" unset mapleader
" try setting it to comma

let mapleader=','

