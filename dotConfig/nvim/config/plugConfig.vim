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
\}

let g:UltiSnipsJumpForwardTrigger="<leader>k"
let g:UltiSnipsJumpBackwardTrigger="<leader>f"

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
\   'python': ['isort', 'autopep8'],
\   'sh': ['shfmt'],
\}
let g:ale_linters = {
\   'python': ['pyls', 'flake8', 'mypy', 'pylint'],
\   'sh': ['shell', 'shellcheck'],
\   'javascript': ['eslint', 'prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_global = 0
let g:ale_javascript_eslint_use_global = 0

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
