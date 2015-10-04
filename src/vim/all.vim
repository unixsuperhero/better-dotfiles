
" tmp/vimrc


set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif


" tmp/vimrc.local

" /Users/jtoyota/.vimrc.local

"" Josh's edits:

" Grep only within the files that are open in vim
command! -nargs=* Jgrep :silent bufdo vimgrepadd <args> %
ca jgrep Jgrep

set nowrap splitright splitbelow
set t_Co=256
"set cursorline       " I don't want the line highlighted

" normal mode mappings
" TODO: create the mappings for visual mode too
nmap gf :vert wincmd f<CR>
nmap gF :vert wincmd F<CR>

" Other peoples' handy stuff
" <leader> is '\' by default
" nmap <leader>z :call SynStack()<CR>
" function! SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

if filereadable(expand('~/.vimrc.josh'))
  source ~/.vimrc.josh
endif

"if executable('rrails')
"  nmap ,p :!RAILS_ENV=test rrails rspec --format=progress %<cr>
"  nmap ,f :!RAILS_ENV=test rrails rspec %<cr>
"  nmap ,l :exec(':!RAILS_ENV=test rrails rspec %:' . line('.'))<cr>
"else
  nmap ,p :!rspec --format=progress %<cr>
  nmap ,f :!rspec %<cr>
  nmap ,l :exec("!rspec %:" . line("."))<cr>
"endif


" tmp/vimrc.josh

" Jearsh's .vimrc file
" Written in 2009
"
" NOTES ARE AT THE BOTTOM OF THE FILE

syntax on                                         " Turn syntax highlighting on
filetype plugin on                                " Enable loading filetype plugins
filetype indent on                                " Enable loading indentation plugins

hi SignColumn  term=standout ctermfg=4 ctermbg=black guifg=DarkBlue guibg=black

"set textwidth=80                                 " The # of chars on a line before [set wrap] adds a newline
"set autowrite                                    " Write contents of the file, if it has been modified, on buffer exit
set nolist                                        " (Show/Don't Show) special characters represententing whitespace
set nostartofline                                 " I have no ideal what this does right now....
set expandtab                                     " turn tabs into spaces (or: noexpandtab - do not turn tabs into spaces, a tab is a tab)
set shiftround                                    " Round indent to multiple of 'shiftwidth' for > and < commands
set tabstop=2                                     " Use 2 spaces for <Tab> and :retab
set shiftwidth=2                                  " Use 2 spaces for (auto)indent
set softtabstop=2                                 " added by josh, saw it in a different vimrc
set hidden                                        " Allow a modified buffer to be put in the bg, keeping the undo history, etc.
set incsearch                                     " Enable incremental search
set nohlsearch                                    " Don't highlight results of a search
set ignorecase                                    " Case insensitive search by default
set smartcase                                     " Disable 'ignorecase' if [A-Z] is in search query
set laststatus=2                                  " Always show status line, even for one window
set showcmd                                       " Show (partial) commands (or size of selection in Visual mode) in the status line
set number                                        " Show line numbers
set ruler                                         " Show line, column number, and relative position within a file in the status line
set nowrap                                        " don't word wrap
set linebreak                                     " If lines wrap, only wrap on whitespace. Don't split words in half.
set splitright                                    " When you :vs ... start on the right window, not the left
set backspace=indent,eol,start                    " Allow backspacing over everything
set nrformats=octal,hex,alpha                     " Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set scrolloff=0                                   " Scroll when cursor gets within 0 characters of top/bottom edge
set sidescrolloff=2                               " Scroll when cursor gets within 10 characters of left/right edge
set showmatch                                     " When a bracket is inserted, briefly jump to a matching one
set matchtime=2                                   " Jump to matching bracket for 2/10th of a second (works with showmatch)
set modeline modelines=5                          " Turn on # vim: set ft=markdown: style modelines
set wildmenu                                      " Use menu to show command-line completion (in 'full' case)
set wildmode=list:longest,full                    " Set command-line completion mode:
set history=1000                                  " Remember up to 1000 'colon' commmands and search patterns
"set backupdir=~/.backups/
"set directory=~/.backups/
set equalprg=bc                                   " cmd to use when you press = in visual mode
set mouse=a
set t_RV=                                         " Don't request terminal version string (for xterm)
set updatecount=50                                " Write swap file to disk after every 50 characters
set enc=utf-8                                     " Use UTF-8 as the default buffer encoding
"set shortmess=filnxtToO                          " this is the default value, changed it to avoid the hit-enter message
set viminfo='200,\"100,/9000,:9000,n~/.viminfo    " Remember things between sessions
set backupskip=/tmp/*,/private/tmp/*"
set diffopt=filler,iwhite,vertical
set switchbuf=useopen,split

set spellfile=~/.vim/words.utf8.add
set formatprg=par\ -w60re


if has('persistent_undo')
  set undofile
  set undodir=~/.vim/tmp//,~/.vim/undo_files//,~/.vim//,/tmp//
endif

"" " I THINK THIS IS MAKING MY : (key to enter ex mode) SLOW
"" " regex stuff
"" nnoremap / /\v
"" vnoremap / /\v
"" cnoremap %s/ %smagic/
"" cnoremap \>s/ \>smagic/
"" nnoremap :g/ :g/\v
"" nnoremap :g// :g//

" have gf open file under cursor in vertical split
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
" nnoremap <silent> vv <C-w>v
" nnoremap <silent> ss <C-w>s

" inspired by vim-unimpaired
nmap cop :set paste!<cr>       " works great in insert mode <C-o>cop


" ---------------------------------------
" ---------------------------------------
" ---------------------------------------
"  CUSTOMIZATIONS FOR NOTES FILES
" ---------------------------------------
" ---------------------------------------
" ---------------------------------------
"
hi def link markdownCode           Statement
hi def link markdownCodeDelimiter  Statement




"""""" OTHER STUFF



hi! link fsize Directory      "cterm=none ctermfg=4 ctermbg=Black
hi flink cterm=none ctermfg=3 ctermbg=0
hi fRedCheck cterm=standout ctermfg=Red ctermbg=Black
hi fchecked cterm=bold ctermfg=2 ctermbg=0
hi funchecked cterm=bold ctermfg=1 ctermbg=0
hi fother cterm=bold ctermfg=3 ctermbg=0
hi ftime cterm=none ctermfg=Green ctermbg=Black
hi j cterm=none ctermfg=White ctermbg=Cyan

" Used for List Highlighting
  hi listOpen cterm=none ctermfg=1 ctermbg=0
  hi listSmX cterm=bold ctermfg=2 ctermbg=0
  hi listX cterm=none ctermfg=0 ctermbg=1
  hi listNS cterm=bold ctermfg=3 ctermbg=0
  hi listM01 cterm=none ctermfg=0 ctermbg=6
  hi listM02 cterm=none ctermfg=0 ctermbg=White
  hi listM03 cterm=none ctermfg=0 ctermbg=3
  hi listM04 cterm=none ctermfg=0 ctermbg=4
  hi listM05 cterm=none ctermfg=0 ctermbg=5
  hi listM06 cterm=none ctermfg=0 ctermbg=2
  hi listM07 cterm=reverse ctermfg=white ctermbg=0
  hi listM08 cterm=reverse ctermfg=lightblue ctermbg=white
  hi listM09 cterm=none ctermfg=6 ctermbg=0
  hi listM10 cterm=none ctermfg=White ctermbg=0
  hi listM11 cterm=none ctermfg=4 ctermbg=0
  hi listM12 cterm=none ctermfg=5 ctermbg=0
  hi listM13 cterm=none ctermfg=white ctermbg=0
  hi listM14 cterm=none ctermfg=lightblue ctermbg=white

  syn keyword listOpen listOpen
  syn keyword listSmX listSmX
  syn keyword listX listX
  syn keyword listNS listNS
  syn keyword listM01 listM01
  syn keyword listM02 listM02
  syn keyword listM03 listM03
  syn keyword listM04 listM04
  syn keyword listM05 listM05
  syn keyword listM06 listM06
  syn keyword listM07 listM07
  syn keyword listM08 listM08
  syn keyword listM09 listM09
  syn keyword listM10 listM10
  syn keyword listM11 listM11
  syn keyword listM12 listM12
  syn keyword listM13 listM13
  syn keyword listM14 listM14

" Personalize Existing Highlight Groups
hi LineNr cterm=none ctermfg=Red ctermbg=Black
hi IncSearch cterm=none ctermfg=White ctermbg=Cyan
hi Search cterm=none ctermfg=White ctermbg=Cyan
hi Comment cterm=none ctermfg=Gray  " Generic highlight changes
hi String cterm=none ctermfg=DarkGreen
hi treeDir cterm=none ctermfg=Cyan
hi treeUp cterm=none ctermfg=DarkYellow
hi treeCWD cterm=none ctermfg=DarkYellow
hi netrwDir cterm=none ctermfg=Cyan
hi PreProc ctermfg=4
hi SpecialKey ctermfg=5
hi NonText ctermfg=3
hi Underlined ctermfg=2

" Link a,b,c,d to other Highlight Groups
hi link a ErrorMsg
hi link b StatusLine
hi link c Search
hi link d DiffChange

"au BufNewFile  */lists/* set filetype=lists
"au BufNewFile  */lists/* set syntax=lists
"au BufRead     */lists/* set filetype=lists
"au BufRead     */lists/* set syntax=lists
"au BufReadPost */lists/* set filetype=lists
"au BufReadPost */lists/* set syntax=lists

"au BufNewFile,BufRead,BufReadPost * silent call SaveRecentFile()
"


" Syntax Highlighting for my "list" system
" Extract these into their own syntax file
let g:listFiles="{*/lists/*,/Volumes/jearsh/*/readme}"

" --------------------------- AUTOCOMMANDS ---------------------------

augroup autosource_vimrc
  au!

  " AUTO-RELOAD ANY .vimrc* FILE
  au BufWrite,BufWritePost *vimrc* nested source %
augroup END

  " bin/list ---------------------------------------------------------
au BufNewFile,BufRead,BufReadPost */lists/* set filetype=lists syntax=lists
au BufNewFile,BufRead,BufReadPost */lists/hon set wrap
au Filetype */lists/* runtime! ~/.vim/syntax/lists.vim

  " run firefox sandbox in the bg ------------------------------------
" au BufNewFile,BufRead,BufReadPost */browser-extensions/firefox/* nmap ,f :!test_listener 'bin/testff'<cr><cr>
au BufNewFile,BufRead,BufReadPost */browser-extensions/firefox/ff/* nmap <buffer> ,f :!cd %:h; cd "$(git rev-parse --show-toplevel)"; test_listener 'bin/testff'<cr><cr>

  " Go back to the position the cursor
  " was on the last time this file was
  " edited
  " ------------------------------------------------------------------
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

  " makeprgs ---------------------------------------------------------
au FileType ruby       setlocal makeprg=ruby\ -c\ %
au FileType ruby       nmap ,x <plug>(xmpfilter-run)
au FileType ruby       nmap ,m <plug>(xmpfilter-mark)
au FileType eruby      setlocal makeprg=rails-erb-check\ %
au FileType haml       setlocal makeprg=haml\ -c\ %
au FileType sh         setlocal makeprg=bash\ -n\ %
au FileType cucumber   setlocal makeprg=bundle\ exec\ cucumber\ %
au FileType json       setlocal makeprg=jshint\ %
au FileType javascript setlocal makeprg=jshint\ %
au FileType fish       compiler fish
"au FileType help       exe "au BufEnter <buffer> set winminwidth=80 | set winwidth= | set winminwidth=20"
au BufNewFile,BufRead,BufReadPost */Gemfile setlocal makeprg=bundle

"au FileType ruby     nmap ,R :exe "nmap ,r :!rspec " . expand("%") . "\<cr\>"<cr>
"au FileType ruby     nmap ,T :silent exe "nmap ,t :!echo 'bundle exec rspec " . expand("%") . " \\\| sed -n \"/FAILED/p;/ contained:/p;/ were:/p;/[0-9] example/p;/^[[:space:]]*[0-9][0-9]*)/,/:[0-9][0-9]*:/p;/debug_start/,/debug_end/p\"' \\\| pbcopy \<cr\>\<C-L\> \| nmap ,l :exe \"silent !echo 'bundle exec rspec \" . expand(\"%\") . \":\" . line(\".\") . \" \\\| sed -n \\\"/FAILED/p;/ contained:/p;/ were:/p;/[0-9] example/p;/^[[:space:]]*[0-9][0-9]*)/,/:[0-9][0-9]*:/p;/debug_start/,/debug_end/p\\\"' \\\| pbcopy\"\<cr\>\<C-L\>"<CR>
au FileType ruby     nmap ,T :silent exe "nmap ,t :w \\\|silent !echo 'bundle exec rspec " . expand("%") . " \\\| sed -n \"1,3p;/FAILED/p;/ contained:/p;/ were:/p;/[0-9] example/p;/^[[:space:]]*[0-9][0-9]*)/,/:[0-9][0-9]*:/p;/debug_start/,/debug_end/p\"' \>tmp/test_commands\<cr\>\<C-L\> \| nmap ,l :exe \"w \\\|silent !echo 'bundle exec rspec \" . expand(\"%\") . \":\" . line(\".\") . \" \\\| sed -n \\\"1,3p;/FAILED/p;/ contained:/p;/ were:/p;/[0-9] example/p;/^[[:space:]]*[0-9][0-9]*)/,/:[0-9][0-9]*:/p;/debug_start/,/debug_end/p\\\"' \>tmp/test_commands\"\<cr\>\<C-L\>"<CR>
au FileType ruby     nmap ,C :silent exe "nmap ,t :w \\\|silent !echo 'bundle exec rspec " . expand("%") . "' \>tmp/test_commands\<cr\>\<C-L\> \| nmap ,l :exe \"w \\\|silent !echo 'bundle exec rspec \" . expand(\"%\") . \":\" . line(\".\") . \"' \>tmp/test_commands\"\<cr\>\<C-L\>"<CR>
au FileType ruby     nmap ,R :silent exe "nmap ,t :w\\\|silent !echo 'rspec " . expand("%") . "' \>tmp/test_commands\<cr\>\<C-L\> \| nmap ,l :exe \"w\\\|silent !echo 'rspec \" . expand(\"%\") . \":\" . line(\".\") . \"' \>tmp/test_commands\"\<cr\>\<C-L\>"<CR>
au FileType ruby     nmap ,d :silent !echo 'rake docs:v2:build' >tmp/test_commands<cr><C-l>
au FileType ruby     nmap ,g :silent !echo 'rake docs:v2:generate' >tmp/test_commands<cr><C-l>

  " equalprgs (for formatting)
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ %

au FileType markdown   setlocal makeprg=markdown\ %
au FileType markdown   setlocal tw=80

  " bin/notes ---------------------------------------------------------
autocmd BufNewFile,BufRead */notes/* set ft=notes
      " \ if &ft =~# '^\%(markdown\)$' |
      " \   set ft=notes |
      " \ else |
      " \   setf notes |
      " \ endif
au! FileType notes
au FileType notes   setlocal makeprg=markdown\ %
au FileType notes   setlocal tw=80
au FileType notes   nmap ,s :w\|!git add %;git commit -m 'autocommitting %'<cr>

  " bin/task  ---------------------------------------------------------
autocmd BufNewFile,BufRead */tasks/* setlocal tw=60
autocmd BufNewFile,BufRead */tasks/* nmap ,q :wqa<cr>

" au! BufNewFile,BufRead,BufReadPost */notes/* call LcdToNotesDir()

" FORMAT JSON:
" :%s/":\([[{\]},]\+\)/": \1\r/g|%s/,\(["[{]\+\)/,\r\1/g|%s/[\]}]\+,/\r&/g
" set ep=
" norm ggVG=

"1,$retab!

let loaded_matchparen = 1  " Avoid loading MatchParen plugin
let g:netrw_browse_split = 1  " netRW: Open files in a split window

hi popMatch1 cterm=none ctermfg=0 ctermbg=1
hi popMatch2 cterm=none ctermfg=0 ctermbg=6
hi popMatch3 cterm=none ctermfg=0 ctermbg=White
hi popMatch4 cterm=reverse ctermfg=0 ctermbg=White
hi popMatch5 cterm=none ctermfg=0 ctermbg=3
hi popMatch6 cterm=none ctermfg=0 ctermbg=4
hi popMatch7 cterm=none ctermfg=0 ctermbg=5
hi popMatch8 cterm=none ctermfg=0 ctermbg=2
hi popMatch9 cterm=reverse ctermfg=white ctermbg=0
hi popMatch10 cterm=reverse ctermfg=lightblue ctermbg=white

hi Visual term=reverse cterm=reverse guibg=LightGrey

" spell check
ab cls class
ab fun function
ab functino function
ab functinos functions

" normal abbreviations
iab ToC Table of Contents

ab fmtYmd %Y%m%d
ab fmtHMS %H%M%S
ab fmtYmdHMS %Y%m%d%H%M%S

ab fmt_Ymd %Y-%m-%d
ab fmt_HMS %H:%M:%S
ab fmt_YmdHMS %Y-%m-%d %H:%M:%S

ab cur_time =strftime("%Y-%m-%d %H:%M:%S")
ab cur_timestamp =strftime("%s")
ab cur_epoch =strftime("%s")

ab cur_Y =strftime("%Y")
ab cur_y =strftime("%y")
ab cur_m =strftime("%m")
ab cur_d =strftime("%d")
ab cur_Ymd =strftime("%Y%m%d")

ab cur_H =strftime("%H")
ab cur_M =strftime("%M")
ab cur_S =strftime("%S")
ab cur_HMS =strftime("%H%M%S")

ab cur_YmdHMS =strftime("%Y%m%d%H%M%S")

func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

"" useful command abbreviations

" => *this
ca rmthis exe('bun \| !rm -i ' . expand('%'))
ca sothis so %
ca qthis !hque %:p
ca quethis !hque %:p
ca queuethis !hque %:p
ca runthis !%:p
ca shthis !%:p
ca modthis !chmod +x %
ca xthis !chmod +x %
ca llthis !ls -l %
ca rbthis set mp=ruby\ -c\ %
ca tset set?<left>

ca dbdownup !bundle exec rake db:migrate:{down,up} VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>
ca rakedownup !bundle exec rake db:migrate:{down,up} VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>
ca migratedownup !bundle exec rake db:migrate:{down,up} VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>

ca dbdown !bundle exec rake db:migrate:down VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>
ca rakedown !bundle exec rake db:migrate:down VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>
ca migratedown !bundle exec rake db:migrate:down VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>

ca dbup !bundle exec rake db:migrate:up VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>
ca rakeup !bundle exec rake db:migrate:up VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>
ca migrateup !bundle exec rake db:migrate:up VERSION=<c-r>=matchstr(expand('%'), '\d\{10,15\}', '')<cr>

" => *me
ca :: %
ca modme !chmod +x %
ca rbme set mp=ruby\ -c\ %
ca rbmake set mp=ruby\ -c\ %
ca makerb set mp=ruby\ -c\ %
ca mset set?<left>

" => pagers (capture a cmd's stdout in a new vs)
ca man vnew \| set buftype=nofile \| r!man  \| col -b<left><left><left><left><left><left><left><left><left><C-R>=Eatchar('\s')<CR>
ca pager vnew \| set buftype=nofile \| r! \| col -b<M-b><M-b><M-b><left><C-R>=Eatchar('\s')<CR>

" => source this file
ca vimso so ~/.vimrc.josh
ca sovim so ~/.vimrc.josh


ca ll <c-u>!ls -l

" use a vertical split with commands that normally make a horizontal split
ca V vert
ca vh vert h

" use the range defined by the current (or last) visual selection
ca VI '<,'><c-r>=Eatchar('\s')<cr>
ca Vi '<,'><c-r>=Eatchar('\s')<cr>
ca VR '<,'><c-r>=Eatchar('\s')<cr>
ca Vr '<,'><c-r>=Eatchar('\s')<cr>

ca aar argadd
ca aany argadd **/**/**<Left><Left><Left><Left><C-r>=Eatchar('\s')<CR>
ca vall vert sall
ca vnext vert snext
ca vprev vert sprevious

ca note setl buftype=nofile
ca nonote setl buftype=
ca w!! w ! sudo tee "%"
"ca man !man
ca Ls ls
ca LS ls
"ca Make make
ca ake make
ca setpaste set paste!
ca updatewww %s@^\.\(.*\)$@vim -d $beta\1 $www\1@c
ca recent PutRecentFiles

" edit dotfiles
"
ca enote vs ~/notes/**/<C-r>=Eatchar('\s')<cr>


func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
ca erepo vs ~/repos/**/<C-r>=Eatchar('\s')<cr>
ca editrepo vs ~/repos/**/<C-r>=Eatchar('\s')<cr>

ca eview vs app/views/**/<C-r>=Eatchar('\s')<cr>
ca editview vs app/views/**/<C-r>=Eatchar('\s')<cr>

ca erepo vs ~/repos/**/<C-r>=Eatchar('\s')<cr>
ca editrepo vs ~/repos/**/<C-r>=Eatchar('\s')<cr>

ca ebin vs ~/bin/*<C-r>=Eatchar('\s')<cr>
ca editbin vs ~/bin/*<C-r>=Eatchar('\s')<cr>

ca fishfun vs ~/.config/fish/functions/*<C-r>=Eatchar('\s')<cr>
ca fishfunc vs ~/.config/fish/functions/*<C-r>=Eatchar('\s')<cr>
ca fishfunct vs ~/.config/fish/functions/*<C-r>=Eatchar('\s')<cr>
ca fishfunction vs ~/.config/fish/functions/*<C-r>=Eatchar('\s')<cr>

ca editeditrc vs ~/.editrc
ca editinput vs ~/.inputrc
ca editinputrc vs ~/.inputrc
ca editvim vs ~/.vimrc.josh
ca evim vs ~/.vimrc.josh

ca ebundle vs ~/.vimbundles/**<C-r>=Eatchar('\s')<cr>
ca vimbundle vs ~/.vimbundles/**<C-r>=Eatchar('\s')<cr>

ca configbundles vs ~/repos/dot-files/bash/home/vimbundle
ca ebundleconf vs ~/repos/dot-files/bash/home/vimbundle
ca ebundleconfig vs ~/repos/dot-files/bash/home/vimbundle

ca efish vs ~/.config/fish/**/<C-r>=Eatchar('\s')<cr>
ca editfish vs ~/.config/fish/**/<C-r>=Eatchar('\s')<cr>
ca editaliases vs ~/.config/fish/aliases.fish
ca editfunctions vs ~/.config/fish/functions.fish

ca edot vs ~/.*<C-r>=Eatchar('\s')<cr>
ca editdot vs ~/.*<C-r>=Eatchar('\s')<cr>

ca agf AgFile .<Left><Left>

" shell commands

ca goog !google
ca ggrep !git grep -Ein
"ca grep !egrep -rin
ca agg !ag

"ca mkupdatesh /* --- have this reflect how i make my update.sh for zeus/morpheus */

" Aliases for my functions
ca blist Blist
ca nomat NoMatches
ca mktitle Mktitle
ca mkfile Mkfile
ca mkdir Mkdir
ca scratch Scratch
ca mat Match
ca vb Vb
ca ilp IListPrompt
ca seq Seq
ca getoutput CaptureOutput
ca getout CaptureOutput
ca capture CaptureOutput
ca captureoutput CaptureOutput
ca fixlistsyntax FixListSyntax

ca repl ReplStr
ca changenick ChangeNick
ca nick ChangeNick

" My function declarations
command! -nargs=1 ReplStr exe "s/SSS/" . <q-args>
command! -nargs=1 ChangeNick exe '%s#\v(((real|user)_name|nick) [=] ["])[^"]*(["])#\1' . <q-args> . '\4#|w'
command! NoMatches call clearmatches()
command! -range Blist <line1>,<line2>call Bufferlist()
command! -nargs=0 Mktitle s/^\(\s*\)\(.\{-}\)\s*$/\1[ \2 ]/
command! -nargs=0 Mkfile s/^\(\s*\)\(.\{-}\)\s*$/\1[[[ \2 ]]]/
command! -nargs=0 PutRecentFiles call PutRecentFiles()
command! -nargs=0 Mkdir call Mkdir()
command! -nargs=0 FixListSyntax call FixListSyntax()
command! -nargs=0 Scratch call Scratch()
command! -nargs=+ Match call Match(<q-args>)
command! -nargs=* Vb exe "vert sb " . <q-args>
command! -nargs=+ IListPrompt call <SID>IListPrompt(<q-args>)
command! -range -nargs=* Seq <line1>,<line2>call Sequence(<f-args>)
command! -complete=shellcmd -complete=file -complete=dir -nargs=+ CaptureOutput call CaptureOutput(<q-args>)

" My function definitions
function! PutRecentFiles()
  r!cat /var/jearsh/env/recent.vim
  "r!cat /var/jearsh/env/recent.vim | head -15
endfunction

function! s:IListPrompt(pattern)
  let pat = a:pattern
  if strlen(pat) > 0
    if matchstr(pat, "^/") != "/"
      let pat="/" . pat
    endif
    if matchstr(pat, "/$") != "/"
      let pat = pat . "/"
    endif
    let v:errmsg = ""
    exe "ilist! " . pat
    if strlen(v:errmsg) == 0
      let nr = input("Which one: ")
      if nr =~ '\d\+'
        exe "ijump! " . nr . pat
      endif
    endif
  endif
endfunction "tagsrch.txt:673

function! Bufferlist() range
  "silent exe a:firstline . "," . a:lastline . 's/^\s*//'
  "silent exe a:firstline . "," . a:lastline . 's/\s*$//'
  "silent exe a:firstline . "," . a:lastline . 's/"[^"]*$//'
  "silent exe a:firstline . "," . a:lastline . 's/^[^"]*"//'
  "silent exe a:firstline . "," . a:lastline . "!sort -u"

  silent exe a:firstline . "," . a:lastline . 's/^[^"]*"\|"[^"]*$//ge'
  silent exe a:firstline . "," . a:lastline . "!sort -u"
  silent exe "norm gv"
endfunction

function! CaptureOutput(cmd)
  redir => capturedoutput
  silent execute a:cmd
  redir END
  silent put=capturedoutput
endfunction

function! SaveRecentFile ()
  silent !echo %:p >/tmp/recent.txt
  silent !cat /Volumes/jearsh/env/recent.vim | grep -v "%:p" >>/tmp/recent.txt
  silent !cat /tmp/recent.txt >/Volumes/jearsh/env/recent.vim
  "silent !mv /tmp/recent.txt /Volumes/jearsh/env/recent.vim
endfunction

function! LcdToNotesDir()
  if matchstr(expand('%:p'), '/notes/') == ''
    return
  endif
  let xpand = '%:p:h'
  while expand(xpand . ':t') != 'notes'
    let next_xpand = xpand . ':h'
    if expand(xpand) == expand(next_xpand)
      let xpand = '%:p:h'
      break
    endif
    if expand(xpand) == '/'
      let xpand = '%:p:h'
      break
    endif
    let xpand = next_xpand
  endwhile

  execute 'lcd ' . expand(xpand)
endfunction

function! Match(mregex)
  let groups = ["popMatch1", "popMatch2", "popMatch5", "popMatch6", "popMatch7", "popMatch8", "popMatch9", "popMatch10", "popMatch3", "popMatch4"]
  let matches = getmatches()
  while len(matches) > len(groups)
    let matches = matches[len(groups):]
  endwhile
  for mg in groups
    if exists("used")
      unlet used
    endif
    for mm in matches
      if mm.group == mg
        let used = "used"
        break
      endif
    endfor
    if !exists("used")
      let groupToUse = mg
      break
    endif
  endfor
  if !exists("groupToUse")
    let groupToUse = "ErrorMsg"
  endif
  call matchadd(groupToUse, a:mregex)
endfunction

function! Sequence(pat) range
  let x=1
  exe a:firstline . "," . a:lastline . "g" . a:pat . "s" . a:pat . "\\=x/ | let x=x+1"
endfunction

function! CleanupChat() range
  let x=1
  let rng=a:firstline . "," . a:lastline

  " remove all "\d:\d\d [AP]M"
  " s/^(Joshua Toyota|daniel|pedram)\s*\n/<a href="">\1</a>: /
  " get the length of \1
  " take all the lines before the next /^<a href/
  " and add the length of \1 + 2 to te beginning of those lines
  " %s/\v^\s*\n(\s*\n)+//g
  "exe rng . "g" . a:pat . "s" . a:pat . "\\=x/ | let x=x+1"
endfunction

function! Mkdir()
  let path = expand("%:p:h")
  if len(glob(path)) == 0
    echo "Making directory: " . path . " it doesn't exist."
    call mkdir(path, "p")
  else
    echo "Directory already exists..."
  endif
endfunction

function! Scratch()
  let stmp = strftime("%Y%m%d.%H%M%S")
  exe "vs ~/lists/scratch/" . stmp
endfunction

function! FixListSyntax()
  set filetype=lists syntax=lists
  syn match listM09  /[0-9 ]\?[0-9. ]\?[0-9][BKMG]/
  syn match listM09  /\[[^[\]]*\]/
  syn match listNS   /\[\[\[.*\]\]\]/
  syn match listNS   /([^ ]*)/
  syn match listOpen /( )/
  syn match listSmX  /(x)/
  syn match listX    /(X \?.*)/
  syn match listSmX  /(josh @ [^)]\+)/
  syn match listSmX  /((.*))/
  syn match listTime /\d\d\d\d-\d\d-\d\d ..:..:../
endfunction

set nolist                                        " (Show/Don't Show) special characters represententing whitespace

"au Syntax * :RainbowParenthesesLoadRound
"au Syntax * :RainbowParenthesesLoadBraces
"au Syntax * :RainbowParenthesesLoadChevrons
"au Syntax * :RainbowParenthesesLoadRound
"au Syntax * :RainbowParenthesesLoadSquare
"au Syntax * :RainbowParenthesesToggle

" --------------    NOTES    ---------------
" Full .vimrc With Comments:
" /Volumes/jearsh/dev/tests/vim/full.vimrc
"
" Notes:
" ~/lists/unix/vim/tips
" Help Directory:
" /opt/local/share/vim/vim72/doc
" DefaultConfigs:
" /opt/local/share/vim/vim72
" /usr/share/vim/vim72
"
" Resources:
" * http://www.vi-improved.org/vimrc.php
" * http://jmcpherson.org/vimrc.html
"
" Exuberant: ctags - taglist plugin not loaded
" vim $HOME/.vim/plugin/taglist.vim +97,98s#^#\"#
"

"""""""""""""""""""""""""""""""
" Learn Undo Branching in VIM "
" --------------------------- "
"  http://vimdoc.sourceforge.net/htmldoc/undo.html
"  http://vimdoc.sourceforge.net/htmldoc/undo.html#u
"  http://vimdoc.sourceforge.net/htmldoc/insert.html#i_CTRL-G_u
"""""""""""""""""""""""""""""""

