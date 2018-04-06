" Inspired by vimrc file used Claudio Fleiner <claudio@fleiner.com>
" See http://www.fleiner.com/vim/

let spell_auto_type = "noneatall"

fun! FTCheck_m()
  setf octave
endfun
let java_comment_strings=1

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

filetype off                   " required!

source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/plug.vim
source $HOME/.config/nvim/config/plugConfig.vim
source $HOME/.config/nvim/config/cmds.vim
source $HOME/.config/nvim/config/maps.vim
source $HOME/.config/nvim/config/autocommands.vim
source $HOME/.config/nvim/config/colours.vim

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

if filereadable("~/src/smartAutocomplete/plugin/smartautocomplete.vim")
   source ~/src/smartAutocomplete/plugin/smartautocomplete.vim
endif

" let g:neocomplcache_enable_at_startup = 1

" set statusline=%f%h%m%r\ %{fugitive#statusline()}%=%c,%l/%L\ %P

" Custom command-mode completion
" Check out :help :command-completion-custom*
" com -complete=custom,ListUsers -nargs=1 Finger !finger <args>
" fun ListUsers(A,L,P)
"     return system("cut -d: -f1 /etc/passwd")
" endfun
