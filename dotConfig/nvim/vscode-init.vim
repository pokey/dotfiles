source ~/.config/nvim/autoload/plug.vim
source ~/.config/nvim/config/vscode-plug.vim
source ~/.config/nvim/config/vscode-maps.vim

" Use system clipboard by default
set clipboard=unnamed

" Case-insensitive search
set ignorecase
set smartcase

" Remove highlights
nnoremap <silent> gh :noh<cr>