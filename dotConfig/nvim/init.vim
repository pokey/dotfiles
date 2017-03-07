" Inspired by vimrc file used Claudio Fleiner <claudio@fleiner.com>
" See http://www.fleiner.com/vim/

set nocompatible

let spell_auto_type = "noneatall"

set directory=$HOME/.tmp//

" turn on verbosity
" set verbose=10

" define the top hel file
" set helpfile=$VIM/doc/help.txt

set hidden

" no scrolling acceptable
if !has('nvim')
  set ttyscroll=0
endif

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

" set the characters shown for special cases (must be turned on with set list)
se listchars=extends:»,eol:¶,trail:·,tab:»­,precedes:«,nbsp:+

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

set notagrelative

" get special definitions for different file types

" get directory browser
" source $VIM/mymacros/dir.vim

" get directory browser
" source $VIM/mymacros/matchit.vim

" get search highlighter
" source $VIM/set/hisearch.vim
"


fun! FTCheck_m()
  setf octave
endfun

" Filetypes
augroup filetypes
  au!
  au BufNewFile,BufRead *.m                    set ft=objc
  au BufRead,BufNewFile *.scss                 set ft=scss
  au BufRead,BufNewFile .*gdb*                 set ft=gdb
  au BufRead,BufNewFile *.mocha,*.wingdis      set ft=java
  " Test file used for testing various vim settings
  au BufRead,BufNewFile test                   set ft=test
  au BufRead,BufNewFile *\.S                   set ft=asms
  au BufRead,BufNewFile *.bS                   set ft=myasm
  au BufRead,BufNewFile *access_log*,*.httplog set ft=httplog
  au BufRead,BufNewFile *.dtd                  set ft=dtd
  " Percy outline files
  au BufRead,BufNewFile *.otl                  set ft=tex
  au BufRead,BufNewFile *.wm                   set ft=webmacro
  au BufRead,BufNewFile *.wiki                 set ft=wiki
  au BufRead,BufNewFile *.twk                  set ft=twiki
  au BufRead,BufNewFile CONFIG,config          set ft=config
  au BufRead,BufNewFile *html                  set ft=html
  au BufRead,BufNewFile *.jsp                  set ft=jsp
  au BufRead,BufNewFile *.ptr                  set ft=bytecodetr
  au BufRead,BufNewFile *.mxm                  set ft=maxima
  au BufRead,BufNewFile *.conf                 set ft=nginx
  au BufRead,BufNewFile *.handlebars,*.hbs     set ft=html syntax=handlebars
  au BufRead,BufNewFile *.proto                set ft=proto
  au BufRead,BufNewFile rc,.rc                 set ft=sh
  au BufRead,BufNewFile *.dox                  set ft=doxygen
augroup end

augroup gzip
  au!
  au BufReadPost *.httplog.gz set bin | '[,']!gunzip
  au BufReadPost *.httplog.gz set nobin | set readonly
  au BufReadPost *.httplog.gz set filetype=httplog
  au BufWritePost,FileWritePost	*.httplog.gz !mv <afile> <afile>:r
  au BufWritePost,FileWritePost	*.httplog.gz !gzip -9 <afile>:r
augroup end

set ignorecase
set smartcase

augroup tabs
  au!
  au FileType make setlocal noexpandtab
  au FileType snippets setlocal noexpandtab
  au BufRead,BufNewFile *.java set softtabstop=2 shiftwidth=2 expandtab
  au BufRead,BufNewFile *.otl set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
augroup end

set tabstop=3 shiftwidth=3 softtabstop=3 expandtab

set timeout timeoutlen=400
let java_comment_strings=1

" turn off swapfile in battery mode (to conserve energy)
if match(system("/usr/bin/apm"),"off")>0
        set updatecount=0
endif

let is_bash=1
let java_allow_cpp_keywords=1

if has("syntax")
  " let java_mark_braces_in_parens_as_errors=1
  let java_highlight_functions=1
  let java_highlight_debug=1
  let java_sapce_errors=1
  let java_highlight_java_lang_ids=1
  let java_highlight_all=1
  " let java_allow_cpp_keywords=1
  let html_my_rendering=1
  " let java_javascript=1
  " let java_css=1
  " let java_ignore_javadoc=1

endif

augroup something
  au!
  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
augroup end

set nocompatible               " be iMproved
filetype off                   " required!

set nofoldenable

source $HOME/.config/nvim/config/plug.vim
source $HOME/.config/nvim/config/plugConfig.vim
source $HOME/.config/nvim/config/cmds.vim
source $HOME/.config/nvim/config/maps.vim
source $HOME/.config/nvim/config/autocommands.vim

let g:tmux_navigator_no_mappings = 1

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p <sid>Repl()

if has("persistent_undo")
   set undodir=~/.undodir/
   set undofile
endif

if filereadable("~/src/smartAutocomplete/plugin/smartautocomplete.vim")
   source ~/src/smartAutocomplete/plugin/smartautocomplete.vim
endif

let g:jsx_ext_required = 0

" let g:neocomplcache_enable_at_startup = 1

" set statusline=%f%h%m%r\ %{fugitive#statusline()}%=%c,%l/%L\ %P

" Custom command-mode completion
" Check out :help :command-completion-custom*
" com -complete=custom,ListUsers -nargs=1 Finger !finger <args>
" fun ListUsers(A,L,P)
"     return system("cut -d: -f1 /etc/passwd")
" endfun
