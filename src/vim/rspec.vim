
let mapleader=','

nnoremap <leader>f :call RunTests()<cr>
nnoremap <leader>l :call RunTests(1)<cr>

let mapleader=' '

nnoremap <leader>f :call RunTests()<cr>
nnoremap <leader>l :call RunTests(1)<cr>

let mapleader=','

function! RunTests(...)
  let in_test_file = match(expand("%"), '_spec.rb\(:\d\d*\)*$') != -1

  if in_test_file
    let t:hero_rspec_file = expand("%")
    let t:hero_rspec_line = line('.')
  end

  if !exists("t:hero_rspec_file")
    return
  end

  let cmd=':silent' . ' '

  if exists(':Dispatch')
    let cmd .= 'Dispatch bundle exec rspec' . ' ' . t:hero_rspec_file
  elseif exists('~/bin/beatest')
    let cmd .= '!' . expand('~/bin/beatest') . ' ' . t:hero_rspec_file
  else
    let cmd .= '!bundle exec rspec' . ' ' . t:hero_rspec_file
  endif

  if a:0
    let cmd .= ':' . t:hero_rspec_line
  endif

  echom "Running Tests Using: " . cmd

  exe(cmd)

endfunction

