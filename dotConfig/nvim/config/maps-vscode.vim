" Save shortcuts
function! s:exitAndSave()
    call VSCodeNotify("vscode-neovim.compositeEscape1")
    call VSCodeNotify("workbench.action.files.save")
endfunction

inoremap <silent> <C-s> <Cmd>call <SID>exitAndSave()<CR>
