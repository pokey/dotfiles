augroup win
   au!
   au WinEnter * :AddExtraWidth
augroup end

augroup bufwrite
   au!
   au BufWritePost * Neomake
   au BufReadPost * Neomake
augroup end

augroup termenter
   au!
   au BufWinEnter,WinEnter term://* startinsert
augroup end
