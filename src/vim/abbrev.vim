
" tmp/vimrc

" tmp/vimrc.local

ca jgrep Jgrep

" tmp/vimrc.josh

ab cls class
ab fun function
ab functino function
ab functinos functions

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

ca :: %
ca modme !chmod +x %
ca rbme set mp=ruby\ -c\ %
ca rbmake set mp=ruby\ -c\ %
ca makerb set mp=ruby\ -c\ %
ca mset set?<left>

ca man vnew \| set buftype=nofile \| r!man  \| col -b<left><left><left><left><left><left><left><left><left><C-R>=Eatchar('\s')<CR>
ca pager vnew \| set buftype=nofile \| r! \| col -b<M-b><M-b><M-b><left><C-R>=Eatchar('\s')<CR>
ca gstatus Gstatus \| wincmd J
ca gst Gstatus \| wincmd J

ca vimso so ~/.vimrc
ca sovim so ~/.vimrc

ca ll <c-u>!ls -l

ca V vert
ca vh vert h

ca VI '<,'><c-r>=Eatchar('\s')<cr>
ca Vi '<,'><c-r>=Eatchar('\s')<cr>
ca VR '<,'><c-r>=Eatchar('\s')<cr>
ca Vr '<,'><c-r>=Eatchar('\s')<cr>

ca aar argadd
ca aany argadd **/**/**<Left><Left><Left><Left><C-r>=Eatchar('\s')<CR>
ca vall vert sall
ca vnext vert snext
ca vprev vert sprevious

ca snote new \| setl buftype=nofile
ca hnote new \| setl buftype=nofile
ca spnote new \| setl buftype=nofile

ca vnote  vnew \| setl buftype=nofile
ca vsnote vnew \| setl buftype=nofile

ca scratchthis setl buftype=nofile
ca noscratchthis setl buftype=
ca notethis setl buftype=nofile
ca nonotethis setl buftype=

ca ww w!
ca waw wall!
ca waa wall!

ca qq q!
ca qaq qall!
ca qaa qall!
ca w!! w ! sudo tee "%"
ca Ls ls
ca LS ls
ca ake make
ca setpaste set paste!
ca updatewww %s@^\.\(.*\)$@vim -d $beta\1 $www\1@c
ca recent PutRecentFiles

ca enote vs ~/notes/**/<C-r>=Eatchar('\s')<cr>

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
ca editvim vs ~/.vimrc
ca evim vs ~/.vimrc

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

ca goog !google
ca ggrep !git grep -Ein
ca agg !ag

ca blist Blist
ca nomat NoMatches
ca mktitle Mktitle
ca mkfile Mkfile
ca mkdir Mkdir
ca scratch Scratch
ca mat Match
ca vb vert sb
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

