
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
vnoremap <leader>hns :HeroNoteSave<cr>

nnoremap <leader>hns :HeroNoteSave<cr>
vnoremap <leader>hns :<c-u>'<,'>HeroNoteSave<cr>

nnoremap <leader>hnd o--- next note ---<cr>

nnoremap <leader>hncp o #hero #h #todo #projectfile<esc>0i
nnoremap <leader>hncn o #hero #todo #notes<esc>0i

nnoremap <leader>hno mm0vi'"fy`m:e <c-r>f<cr>
nnoremap <leader>hne mm0vi'"fy`m:e <c-r>f<cr>
nnoremap <leader>hnh mm0vi'"fy`m:sp <c-r>f<cr>
" nnoremap <leader>hnv :norm $vT "iy0:vs <c-r>i<cr>
nnoremap <leader>hnv mm0vi'"fy`m:vs <c-r>f<cr>

let mapleader=','

command! -range -nargs=0 HeroNoteSave <line1>,<line2>call NoteSave(<f-args>)
function! NoteSave() range
  let stamp=strftime("%Y%m%d%H%M%S")
  exe a:firstline . "," . a:lastline . "!note save"
endfunction

command! -nargs=+ LocalVsOldfile call LocalVsplitMatchingOldfilePartialFilename(<f-args>)
function! LocalVsplitMatchingOldfilePartialFilename(pattern, ...)
  echom 'CHECKING a:pattern => "' . a:pattern . '"'
  if(exists('a:1'))
    echom 'CHECKING a:1  => "' . a:1  . '"'
  endif

  let matching_files = []

  for the_oldfile in v:oldfiles
    if( match(glob(the_oldfile), '^' . glob(getcwd())) == -1)
      continue
    endif

    if( match(the_oldfile, a:pattern) != -1 )
      call add(matching_files, the_oldfile)
    endif
  endfor

  if(len(matching_files) > 4)
    echom 'THE LENGTH OF matching_files is => ' . len(matching_files)
    echom 'List of matching files:'
    for ofile in matching_files
      echom '  ' . ofile
    endfor
    echom 'Do you want to open all of the following files into splits?'
    let openall_answer = inputlist(['1. Yes', '2. No'])
    if(openall_answer == 1)
      for matching_file in matching_files
        if(exists('a:1') && len(a:1) > 0)
          echom '[DRY RUN] would have executed: => vs "' . matching_file . '"'
        else
          echom 'running command => vs "' . matching_file . '"'
          exe('vs ' . matching_file)
        endif
      endfor
    endif
  elseif(len(matching_files) >= 1)
    for matching_file in matching_files
      if(exists('a:1') && len(a:1) > 0)
        echom '[DRY RUN] would have executed: => vs "' . matching_file . '"'
      else
        echom 'running command => vs "' . matching_file . '"'
        exe('vs ' . matching_file)
      endif
    endfor
  else
    return -1
  endif
endfunction
cabbrev lvf LocalVsOldfile

command! -nargs=+ VsOldfile call VsplitMatchingOldfilePartialFilename(<f-args>)
function! VsplitMatchingOldfilePartialFilename(pattern, ...)
  let matching_files = []

  for the_oldfile in v:oldfiles
    if( match(the_oldfile, a:pattern) != -1 )
      call add(matching_files, the_oldfile)
    endif
  endfor

  if(len(matching_files) > 4)
    echom 'THE LENGTH OF matching_files is => ' . len(matching_files)
    echom 'List of matching files:'
    for ofile in matching_files
      echom '  ' . ofile
    endfor
    echom 'Do you want to open all of the following files into splits?'
    let openall_answer = inputlist(['1. Yes', '2. No'])
    if(openall_answer == 1)
      for matching_file in matching_files

        if(exists('a:1') && len(a:1) > 0)
          echom '[DRY RUN] would have executed: => vs "' . matching_file . '"'
        else
          echom 'running command => vs "' . matching_file . '"'
          exe('vs ' . matching_file)
        endif

      endfor
    endif
  elseif(len(matching_files) >= 1)
    for matching_file in matching_files

      if(exists('a:1') && len(a:1) > 0)
        echom '[DRY RUN] would have executed: => vs "' . matching_file . '"'
      else
        echom 'running command => vs "' . matching_file . '"'
        exe('vs ' . matching_file)
      endif

    endfor
  else
    return -1
  endif
endfunction
cabbrev vf VsOldfile

cabbrev safeil <c-r>=system('ilstart ' . expand('%'))<cr>,$il!/<C-r>=Eatchar('\s')<cr>

