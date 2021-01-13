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

map <Leader><Leader> <Plug>(easymotion-prefix)
map <Leader><Leader>a <Plug>(easymotion-jumptoanywhere)
map <Leader>s <Plug>(easymotion-s)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

nnoremap <silent> gp <Cmd>call VSCodeNotify('git.push')<CR>
nnoremap <silent> gm <Cmd>call VSCodeNotify('editor.action.toggleMinimap')<CR>
nnoremap <silent> ga <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
nnoremap <silent> ge <Cmd>call VSCodeNotify('chmod.plusX')<CR>
nnoremap <silent> gk <Cmd>call VSCodeNotify('workbench.scm.focus')<CR>
nnoremap <silent> gr <Cmd>call VSCodeNotify('editor.action.rename')<CR>
nnoremap <silent> gy <Cmd>call VSCodeNotify('references-view.findReferences')<CR>
nnoremap <silent> gt <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>
nnoremap <silent> gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap <silent> g<bs> <Cmd>call VSCodeNotify('workbench.action.openPreviousRecentlyUsedEditorInGroup')<CR>
nnoremap <silent> gl <Cmd>call VSCodeNotify('workbench.action.openNextRecentlyUsedEditorInGroup')<CR>
nnoremap <silent> K <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <silent> qn <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap <silent> qp <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>

nnoremap <silent> : <Cmd>call VSCodeNotify('workbench.action.showCommands')<CR>
nnoremap g: :