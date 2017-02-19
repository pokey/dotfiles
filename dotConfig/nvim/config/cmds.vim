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
command! Xbit call SetExecutableBit()

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
command! ToggleExtraWidth call s:ToggleExtraWidth()

function! s:AddExtraWidth()
   let l:textwidth = &textwidth
   let l:mywidth = winwidth(0)
   if (l:mywidth < l:textwidth)
      silent exec 'vertical resize ' . l:textwidth
   endif
endfunction
command! AddExtraWidth call s:AddExtraWidth()
