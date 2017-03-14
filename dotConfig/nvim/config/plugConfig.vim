let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:vim_markdown_new_list_item_indent = 2

let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

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

highlight clear SignColumn
highlight SpellBad ctermbg=000

let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
let g:neomake_python_enabled_makers = ['flake8']

let g:syntastic_html_tidy_ignore_errors = [
    \  'plain text isn''t allowed in <head> elements',
    \  '<base> escaping malformed URI reference',
    \  'discarding unexpected <body>',
    \  '<script> escaping malformed URI reference',
    \  '</head> isn''t allowed in <body> elements',
    \  '<div> attribute "id" has invalid value'
    \ ]

let g:peekaboo_delay = 750
