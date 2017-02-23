let mapleader = "|"

let g:user_emmet_leader_key='<c-y>'
imap <leader>, <c-y>,
vmap <leader>, <c-y>,

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" tnoremap <Esc> <C-\><C-n>

" s{char}{char} to move to {char}{char}
nmap <leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nnoremap <silent> <c-h>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-h>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-h>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-h>l :TmuxNavigateRight<cr>
" nnoremap <silent> <c-h>o :TmuxNavigatePrevious<cr>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

map <silent> <Char-0xA1> :tabn 1<cr>
map <silent> <Char-0x2122> :tabn 2<cr>
map <silent> <Char-0xA3> :tabn 3<cr>
map <silent> <Char-0xA2> :tabn 4<cr>
map <silent> <Char-0x221E> :tabn 5<cr>

nnoremap <silent> <leader>k :FZF<cr>
nnoremap <silent> <leader>j :Buffers<cr>
nnoremap <silent> g/ :History/<cr>
nnoremap <silent> g; :History:<cr>
nnoremap <silent> g? :Helptags/<cr>
nnoremap <silent> gx :Commands<cr>
nnoremap <silent> gi :UltiSnipsEdit<cr>
nnoremap qa :tabe<space>
nnoremap gl :cd %:h<cr>
nnoremap <silent> Q :q<cr>
nnoremap <silent> <C-k> <C-w><C-w>
nnoremap <silent> <leader><space> <C-w><C-w>
" tnoremap <silent> <C-k> <C-\><C-n><C-w><C-w>
nnoremap <silent> <C-j> :vertical wincmd F<CR>
nnoremap <C-s> :w<cr>
imap <C-s> <ESC>:w<cr>
nnoremap <leader>n :e<space>%:h/
nnoremap <leader>i :Isort<cr>
nnoremap gs :Ag<space>
nnoremap <C-p> :e<space>
imap <c-x><c-f> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> gn :noh<cr>
nnoremap <silent> gu :UndotreeToggle<cr>
nnoremap <silent> gf :NERDTreeToggle<cr>
nnoremap <silent> gk :Goyo<cr>
nnoremap <silent> gr :e<cr>
nmap <bslash><bslash> gcc
nmap <bslash> gc
vmap <bslash> gc
nnoremap gm :!cp<space>%<space>%:h/
nnoremap <silent> <leader>a :ArgWrap<CR>
nnoremap <silent> <leader>g :RopeGotoDefinition<cr>

vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>y "+y`]
nnoremap <Leader>p "+p`]
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p`]
vnoremap <Leader>P "+P

onoremap ii :<c-u>normal! `[v`]<cr>
vnoremap ii :<c-u>normal! `[v`]<cr>

onoremap i0 i)
vnoremap i0 i)

" nmap <C-y> :call g:AddFile()<CR>
" nmap <C-y> :call g:AddParentDir()<CR>
map <C-y> :let g:SMARTAUTOCOMPLETE_URI='http://localhost:808

nnoremap ge :Xbit<cr>

nnoremap <silent> <leader>w :ToggleExtraWidth<cr>

" multi search on alt 8
nmap 8 :exe "Search ".expand("<cword>")<cr>

map <silent> [w <Plug>CamelCaseMotion_w
map <silent> [b <Plug>CamelCaseMotion_b
map <silent> [e <Plug>CamelCaseMotion_e

omap <silent> i[w <Plug>CamelCaseMotion_iw
xmap <silent> i[w <Plug>CamelCaseMotion_iw
omap <silent> i[b <Plug>CamelCaseMotion_ib
xmap <silent> i[b <Plug>CamelCaseMotion_ib
omap <silent> i[e <Plug>CamelCaseMotion_ie
xmap <silent> i[e <Plug>CamelCaseMotion_ie

"map <alt>, and <alt>. to jump up and down the tag list
map <esc>, :tp<CR>
map <esc>. :tn<CR>

"map <hift><alt>. and <shift><alt>, to jump up and down the error/grep list
map <esc>< :cp<CR>
map <esc>> :cn<CR>
map <esc>V :cc<cr>
map <esc>L :cw<cr>

" shifted function keys
map <esc>[23~ <s-f1>
map <esc>[24~ <s-f2>
map <esc>[25~ <s-f3>
map <esc>[26~ <s-f4>
map <esc>[28~ <s-f5>
map <esc>[29~ <s-f6>
map <esc>[31~ <s-f7>
map <esc>[32~ <s-f8>
map <esc>[33~ <s-f9>
map <esc>[34~ <s-f10>
map <esc>[23$ <s-f11>
map <esc>[24$ <s-f12>
