
" set mapleader to space

let mapleader=' '

" Hero: Jump To Next Git Conflict

nnoremap <leader>hgc  :exe('/^[<>=]\{7}/')<cr>
nnoremap <leader>hgC  :exe('?^[<>=]\{7}?')<cr>

" hero

" Hero Notes

"" Open a note from the timestamp only

nm <leader>hon :vs ~/hero/notes/.index/<cword>.hdoc<cr>

"" Open a bg window for importing a bunch of notes

nnoremap <leader>ni  :!tbg 'note import'<cr>
nnoremap <leader>hni :!tbg 'note import'<cr>

nnoremap <leader>ns :HeroNoteSave<cr>
vnoremap <leader>ns :HeroNoteSave<cr>

nnoremap <leader>hns :HeroNoteSave<cr>
vnoremap <leader>hns :<c-u>'<,'>HeroNoteSave<cr>

nnoremap <leader>hnd o--- next note ---<cr>

nnoremap <leader>hncp o #hero #h #todo #projectfile<esc>0i
nnoremap <leader>hncn o #hero #todo #notes<esc>0i

let mapleader=','

command! -range -nargs=0 HeroNoteSave <line1>,<line2>call NoteSave(<f-args>)
function! NoteSave() range
  let stamp=strftime("%Y%m%d%H%M%S")
  exe a:firstline . "," . a:lastline . "!note save"
endfunction

