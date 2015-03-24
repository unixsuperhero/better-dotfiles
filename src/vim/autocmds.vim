
" tmp/vimrc

augroup vimrc
  au!

  " tmp/vimrc.local

  " tmp/vimrc.josh


  au BufWrite,BufWritePost *vimrc* nested source %

  au BufNewFile,BufRead,BufReadPost */lists/* set filetype=lists syntax=lists
  au BufNewFile,BufRead,BufReadPost */lists/hon set wrap
  au Filetype lists runtime! ~/.vim/syntax/lists.vim

  au BufNewFile,BufRead,BufReadPost .vimbundle* set filetype=vimbundle syntax=vimbundle
  au FileType vimbundle       setlocal makeprg=vimbundles.sh

  au BufNewFile,BufRead,BufReadPost */browser-extensions/firefox/ff/* nmap <buffer> ,f :!cd %:h; cd "$(git rev-parse --show-toplevel)"; test_listener 'bin/testff'<cr><cr>

  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

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
  au BufNewFile,BufRead,BufReadPost */Gemfile setlocal makeprg=bundle

  " au FileType ruby     nmap ,T :silent exe "nmap ,t :w \\\|silent !echo 'bundle exec rspec " . expand("%") . " \\\| sed -n \"1,3p;/FAILED/p;/ contained:/p;/ were:/p;/[0-9] example/p;/^[[:space:]]*[0-9][0-9]*)/,/:[0-9][0-9]*:/p;/debug_start/,/debug_end/p\"' \>tmp/test_commands\<cr\>\<C-L\> \| nmap ,l :exe \"w \\\|silent !echo 'bundle exec rspec \" . expand(\"%\") . \":\" . line(\".\") . \" \\\| sed -n \\\"1,3p;/FAILED/p;/ contained:/p;/ were:/p;/[0-9] example/p;/^[[:space:]]*[0-9][0-9]*)/,/:[0-9][0-9]*:/p;/debug_start/,/debug_end/p\\\"' \>tmp/test_commands\"\<cr\>\<C-L\>"<CR>
  au FileType ruby     nmap ,C :silent exe "nmap ,t :w \\\|silent !echo 'bundle exec rspec " . expand("%") . "' \>tmp/test_commands\<cr\>\<C-L\> \| nmap ,l :exe \"w \\\|silent !echo 'bundle exec rspec \" . expand(\"%\") . \":\" . line(\".\") . \"' \>tmp/test_commands\"\<cr\>\<C-L\>"<CR>
  au FileType ruby     nmap ,R :silent exe "nmap ,t :w\\\|silent !echo 'rspec " . expand("%") . "' \>tmp/test_commands\<cr\>\<C-L\> \| nmap ,l :exe \"w\\\|silent !echo 'rspec \" . expand(\"%\") . \":\" . line(\".\") . \"' \>tmp/test_commands\"\<cr\>\<C-L\>"<CR>
  au FileType ruby     nmap ,d :silent !echo 'rake docs:v2:build' >tmp/test_commands<cr><C-l>
  au FileType ruby     nmap ,g :silent !echo 'rake docs:v2:generate' >tmp/test_commands<cr><C-l>

  " au FileType ruby     nmap ,T :silent exe "nmap ,t :w \\\|silent !beatest " . expand("%") . "\<cr\>\<C-L\> \| nmap ,l :exe \"w \\\|silent !echo 'bundle exec rspec \" . expand(\"%\") . \":\" . line(\".\") . \" \\\| sed -n \\\"1,3p;/FAILED/p;/ contained:/p;/ were:/p;/[0-9] example/p;/^[[:space:]]*[0-9][0-9]*)/,/:[0-9][0-9]*:/p;/debug_start/,/debug_end/p\\\"' \>tmp/test_commands\"\<cr\>\<C-L\>"<CR>
  au FileType ruby     nmap ,T :silent exe("nmap ,t :w \\\|silent !beatest " . expand("%") . "\<cr\>\<C-L\>")<CR>
  au FileType ruby     nmap ,L :silent exe("nmap ,l :w \\\|silent !beatest " . expand("%") . ":" . line(".") . "\<cr\>\<C-L\>")<CR>

  au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ %

  au FileType markdown   setlocal makeprg=markdown\ %
  au FileType markdown   setlocal tw=80

  au FileType notes   setlocal makeprg=markdown\ %
  au FileType notes   setlocal tw=80
  au FileType notes   nmap ,s :w\|!git add %;git commit -m 'autocommitting %'<cr>

  " au BufNewFile,BufRead,BufReadPost */hero/notes/* setlocal ft=notes2
  " au FileType notes2  setlocal ff=unix


  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces

augroup END
