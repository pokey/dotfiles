" Make file executable
" from http://vim.wikia.com/wiki/Setting_file_attributes_without_reloading_a_buffer
function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod a+x %
  checktime
  execute "au! FileChangedShell " . fname
endfunction
command! -bar Xbit call SetExecutableBit()

" When the screen is smaller than wrap width, use this shortcut to make it wide
" enough, and then switch back to even split
function! s:ToggleExtraWidth()                
   let l:mywidth = winwidth(0)
   let l:textwidth = &textwidth
   let l:half = (&columns - 1) / 2
   if (abs(l:mywidth - l:half) <= 1)
      silent exec 'vertical resize ' . l:textwidth
   else
      silent exec 'vertical resize ' . l:half
   endif
endfunction
command! -bar ToggleExtraWidth call s:ToggleExtraWidth()

function! s:AddExtraWidth()
   let l:textwidth = &textwidth
   let l:winwidth = winwidth(0)
   if (l:winwidth < l:textwidth)
      silent exec 'vertical resize ' . l:textwidth
   endif
endfunction
command! -bar AddExtraWidth call s:AddExtraWidth()

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        silent exec 'topleft split | buf ' . t:other 
        " XXX Figure out how to get it to play nicely with termenter autocmd
        silent exec 'wincmd j'
        let t:zoomed = 0
    else
        let t:other = expand('%')
        let t:zoomed = 1
        silent exec 'q'
    endif
endfunction
command! -bar ZoomToggle call s:ZoomToggle()

" Take a traceback that's been converted to a python string and make it pretty
function! s:PrettyTraceback()
    " Save cursor position and 'a' register
    let l:save_cursor = getpos(".")   
    let l:var_a = getreg('a', 1, 1)
    let l:var_amode = getregtype('a')

    " Find string, yank it, and store it
    call search('Trace', 'b')
    normal! hv
    call search("[^\\\\]'")
    silent normal! l"ay
    let l:val = getreg('a')

    " Turn into python program
    " XXX Don't just randomly save it to __pretty_traceback__
    let l:val = substitute(l:val, '\n', '', 'g')
    let l:val = "open('.__pretty_traceback__', 'w').write(".l:val.")"

    " Run the python program
    exe "python ".l:val

    " Restore cursor position and 'a' register
    call setpos('.', l:save_cursor)   
    call setreg('a', l:var_a, l:var_amode)
    exe "spl .__pretty_traceback__"
endfunction
command! -bar PrettyTraceback call s:PrettyTraceback()

" Adapted from https://ubuntuincident.wordpress.com/2016/06/01/vim-run-current-file-with-python/
function! s:RunWithPython()
   " This is the macro to grab the traceback: ?Tracebackhv/[^\\]'ly
   let first = getline(1)
   let first = substitute(first, "^#!", "", "")
   let first = substitute(first, "\n", "", "")
   let exe = ""    " the Python binary to call

   if first =~ "/usr/bin/env "
      let exe = split(first)[-1]
   elseif first == "/opt/anaconda3/bin/python3"
      let exe = first
   endif
   if exe == ""
      let exe = "python"
   endif
   " echo exe
   echo system(exe . " " . expand('%'))
endfunction
command! -bar RunWithPython call s:RunWithPython()

function! s:TermLeave()
   let b:was_term = 1
endfunction
command! -bar TermLeave call s:TermLeave()

function! s:MaybeEnterTerm()
   if exists('b:was_term') && b:was_term
      let b:was_term = 0
      startinsert
   endif
endfunction
command! -bar MaybeEnterTerm call s:MaybeEnterTerm()

command! -bar -nargs=1 -bang RenameCopy saveas<bang> %:h/<args>

let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --smart-case --hidden -g ''!.git'' --follow --color "always" '

command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

let g:rg_words_command = 'rg --column --line-number --no-heading --fixed-strings --smart-case --hidden -g ''!.git'' --follow --word-regexp --color "always" '

command! -bang -nargs=* Rg call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rgw call fzf#vim#grep(g:rg_words_command .shellescape(<q-args>), 1, <bang>0)
