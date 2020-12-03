let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:vim_markdown_new_list_item_indent = 2

let g:VM_mouse_mappings = 1
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"] = '<c-j>'
let g:VM_maps["Add Cursor Up"] = '<c-k>'
let g:VM_custom_noremaps = {
\   '_' : '_',
\   ';' : ';',
\   '==': '==',
\   '<<': '<<',
\   '>>': '>>',
\   'O': 'O',
\   'o': 'o',
\}

let g:UltiSnipsJumpForwardTrigger="<leader>k"
let g:UltiSnipsJumpBackwardTrigger="<leader>f"
let g:UltiSnipsExpandTrigger="<c-tab>"

let g:jsx_ext_required = 0
let g:tmux_navigator_no_mappings = 1

let g:autotagTagsFile=".tags"
let g:autotagCtagsCmd="ctags ".$CTAGS_FLAGS

let g:rainbow#pairs = [['(', ')'], ['[', ']']]

let g:airline_powerline_fonts = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
let g:airline_section_x = airline#section#create_right(['tagbar', 'filetype'])
let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#obsession#indicator_text = '🔴'

highlight clear SignColumn
highlight SpellBad ctermbg=000

let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint', 'importjs'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'python': ['isort', 'autopep8'],
\   'sh': ['shfmt'],
\}
let g:ale_linters = {
\   'python': ['pyls', 'flake8', 'mypy', 'pylint'],
\   'sh': ['shell', 'shellcheck'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier', 'standard'],
\   'typescriptreact': ['eslint', 'prettier', 'standard'],
\}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_global = 0
let g:ale_javascript_eslint_use_global = 0
let g:ale_typescript_prettier_use_global = 0
let g:ale_typescript_eslint_use_global = 0

let g:syntastic_html_tidy_ignore_errors = [
    \  'plain text isn''t allowed in <head> elements',
    \  '<base> escaping malformed URI reference',
    \  'discarding unexpected <body>',
    \  '<script> escaping malformed URI reference',
    \  '</head> isn''t allowed in <body> elements',
    \  '<div> attribute "id" has invalid value'
    \ ]

let g:peekaboo_delay = 750

let g:user_emmet_settings = {
\    'html' : {
\        'snippets' : {
\            'fa': '<i class="fa fa-|" aria-hidden="true"></i>',
\        },
\        'aliases': {
\            'se': 'section',
\        },
\    },
\    'javascript' : {
\        'extends' : 'jsx',
\    },
\}

let g:argwrap_tail_comma = 1

let g:tex_flavor = 'latex'

highlight CocErrorSign ctermfg=196  ctermbg=53
highlight Pmenu ctermfg=198  ctermbg=53

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ?
            \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<leader>k'
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
