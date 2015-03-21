
let mapleader=' '
nnoremap <leader>f :call RunTests()<cr>
nnoremap <leader>l :call RunTests(1)<cr>

function! RunTests(...)
  let in_test_file = match(expand("%"), '_spec.rb\(:\d\d*\)*$') != -1
  if in_test_file
    let t:hero_rspec_file = expand("%")
    let t:hero_rspec_line = line('.')
  elseif !exists("t:hero_rspec_file")
    return
  end

  let cmd=':!' . expand('~/bin/beatest') . ' ' . t:hero_rspec_file

  echom "cmd before: " . cmd

  if a:0
    echom "if a:0 is true"
    let cmd=cmd . ':' . t:hero_rspec_line
  endif

  echom "cmd after: " . cmd

  exe(cmd)

"   if a:0 >= 1
"     echo "a:0 != 0 => " . a:0
"   else
"     echo "a:0 == 0 => " . a:0
"   end

"   if a:0 >= 1
"     echo ':!' . expand('~/bin/beatest') . ' ' . t:hero_rspec_file . ':' . t:hero_rspec_line
"     exe(':!' . expand('~/bin/beatest') . ' ' . t:hero_rspec_file . ':' . t:hero_rspec_line)
"   else
"     echo ':!' . expand('~/bin/beatest') . ' ' . t:hero_rspec_file
"     exe(':!' . expand('~/bin/beatest') . ' ' . t:hero_rspec_file)
"   endif
endfunction

