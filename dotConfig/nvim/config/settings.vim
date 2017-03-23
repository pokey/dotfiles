set directory=$HOME/.tmp//
set nocompatible

set virtualedit=""

set showtabline=0

set hidden

" no scrolling acceptable
if !has('nvim')
  set ttyscroll=0
endif

" set the characters shown for special cases (must be turned on with set list)
se listchars=extends:»,eol:¶,trail:·,tab:»­,precedes:«,nbsp:+

" no mouse in xterm
set mouse=

" do not wrap lines
set nowrap

"don't add two spaces after ., ?, !
set nojoinspaces

" define the viminfo file
set viminfo='50,<1000,:50,n~/.viminfo

" allow the cursor to wrap on anything
set whichwrap=b,s,h,l,<,>,[,]

" we have a fast terminal connection
set ttyfast

" wildmode: complete to longest match, list on second tab
set wildmode=longest,list

" default make program to use
set makeprg=gmake

" the error format works for gcc,                           javac,                                                      jikes (32) (after filtering)
set errorformat=%f:%l:%c:%m,%f:kk%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m,\"%f\"\\\,\ line\ %l.%c:%m\,\ %f:%l:%m,%f:%l:%c:%m

" write buffers automagically when leaving them
set autowrite

" recognize ^M files

if !has('nvim')
  set textauto
endif

" check one line for commands in each file
set modelines=1

" insert tabs as spaces
set expandtab

" highlight all search results
set hlsearch

" set the minimum window height
set winminheight=0

set textwidth=79

set smartindent

" set highlight mode
" set highlight=8b,@-,db,es,lb,mb,M-,nu,rs,sr,tb,vr,ws

" suffixes to put to the end of the list when completing file names
set suffixes=.bak,~,.o,.h,.info,.swp,.class

" patterns to put to ignore when completing file names
set wildignore=*.bak,~,*.o,*.info,*.swp,*.class

set tags=.tags;

set ignorecase
set smartcase

set tabstop=3 shiftwidth=3 softtabstop=3 expandtab

set timeout timeoutlen=400

" turn off swapfile in battery mode (to conserve energy)
if match(system("/usr/bin/apm"),"off")>0
        set updatecount=0
endif

set nofoldenable

set nocompatible               " be iMproved

if has("persistent_undo")
   set undodir=~/.undodir/
   set undofile
endif
