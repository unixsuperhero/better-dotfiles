
" tmp/vimrc

" tmp/vimrc.local

command! -nargs=* Jgrep :silent bufdo vimgrepadd <args> %


function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>z :call SynStack()<CR>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Space>z :ZoomToggle<CR>

" tmp/vimrc.josh

func! Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

command! -nargs=1 ReplStr exe "s/SSS/" . <q-args>
command! -nargs=1 ChangeNick exe '%s#\v(((real|user)_name|nick) [=] ["])[^"]*(["])#\1' . <q-args> . '\4#|w'
command! NoMatches call clearmatches()
command! -range Blist <line1>,<line2>call Bufferlist()
command! -nargs=0 Mktitle s/^\(\s*\)\(.\{-}\)\s*$/\1[ \2 ]/
command! -nargs=0 Mkfile s/^\(\s*\)\(.\{-}\)\s*$/\1[[[ \2 ]]]/
command! -nargs=0 PutRecentFiles call PutRecentFiles()
" command! -nargs=0 Mkdir call Mkdir()
command! -nargs=0 FixListSyntax call FixListSyntax()
command! -nargs=0 Scratch call Scratch()
command! -nargs=+ Match call Match(<q-args>)
command! -nargs=* Vb exe "vert sb " . <q-args>
command! -nargs=+ IListPrompt call <SID>IListPrompt(<q-args>)
command! -range -nargs=* Seq <line1>,<line2>call Sequence(<f-args>)
command! -complete=shellcmd -complete=file -complete=dir -nargs=+ CaptureOutput call CaptureOutput(<q-args>)
command! -nargs=* SwapText call <SID>SwapPatterns(<args>)
command! -range -nargs=* SwapTextF <line1>,<line2>call <SID>SwapPatterns(<f-args>)
command! -nargs=* SwapTextQ call <SID>SwapPatterns(<q-args>)

function! PutRecentFiles()
  r!cat /var/jearsh/env/recent.vim
  "r!cat /var/jearsh/env/recent.vim | head -15
endfunction

function! s:SwapPatterns(pattern_a, pattern_b, flags) range
  let pat_a = a:pattern_a
  let pat_b = a:pattern_b
  if strlen(pat_a) == 0 || strlen(pat_b) == 0
    echom '2 args are required'
    return
  endif

  let pat_a = substitute(pat_a, '^\/\|\/$', '', 'g')
  let pat_b = substitute(pat_b, '^\/\|\/$', '', 'g')
  echom 'pat_a => "' . pat_a . '"'
  echom 'pat_b => "' . pat_b . '"'

  let line_range = a:firstline . ',' . a:lastline
  let pattern_a = line_range . 's/' .       pat_a . '/z' .     pat_b . 'z/' . flags
  let pattern_b = line_range . 's/z\@<!' .  pat_b . 'z\@!/' .  pat_a . '/'  . flags
  let pattern_c = line_range . 's/z' .      pat_b . 'z/' .     pat_b . '/'  . flags


  " let patterns_two = a:firstline . ',' . a:lastline . 's/' . pat_b . '/z' . pat_a . 'z/|'
  " let patterns_two .= 's/z\@<!' . pat_a . 'z\@!/' . pat_b . '/|'
  " let patterns_two .= 's/z' . pat_a . 'z/' . pat_a . '/gce'

  " echom 'PATTERNS_TWO'
  " exe(patterns_two)

  echom 'PATTERNS => "' . patterns . '"'

  exe(patterns)

  return 0

  let v:errmsg = ''
  exe 'ilist! ' . pat
  if strlen(v:errmsg) == 0
    let nr = input('Which one: ')
    if nr =~ '\d\+'
      exe 'ijump! ' . nr . pat
    endif
  endif
endfunction "tagsrch.txt:673

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

" function! Mkdir()
"   let path = expand("%:p:h")
"   if len(glob(path)) == 0
"     echo "Making directory: " . path . " it doesn't exist."
"     call mkdir(path, "p")
"   else
"     echo "Directory already exists..."
"   endif
" endfunction

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


