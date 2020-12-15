let mapleader = "\<c-q>"

" Make visual mode yank / paste leave cursor at end, making it easier to
" repeat the command
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
nnoremap <silent> <BS> ;

" Argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>

" Commenting out lines
xmap <bslash> <Plug>VSCodeCommentary
nmap <bslash> <Plug>VSCodeCommentary
omap <bslash> <Plug>VSCodeCommentary
nmap <bslash><bslash> <Plug>VSCodeCommentaryLine

" Select region just pasted
onoremap iu :<c-u>normal! `[v`]<cr>
vnoremap iu :<c-u>normal! `[v`]<cr>

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @+ = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @+
  return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p <sid>Repl()