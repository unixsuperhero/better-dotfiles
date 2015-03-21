if exists("g:loaded_rsi")
  if !empty(mapcheck('<C-E>', 'i'))
    iunmap <expr> <C-E>
  endif
else
  echom "loaded_rsi does not exist"
endif

  if !empty(mapcheck('<C-E>', 'i'))
    echom 'c-e is mapped'
  else
    echom 'c-e is NOT mapped'
  endif

inoremap <expr> g<C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"
