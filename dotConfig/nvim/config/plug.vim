call plug#begin('~/.vim/plugged')

Plug 'saltstack/salt-vim'
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

Plug 'sheerun/vim-polyglot'

Plug 'jparise/vim-graphql'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-obsession'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-pseudocl'
Plug 'bling/vim-airline/'
Plug 'tpope/vim-tbone'

Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'    }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'christoomey/vim-tmux-navigator'

Plug 'mattn/emmet-vim'

Plug 'easymotion/vim-easymotion'

Plug 'mg979/vim-visual-multi'
Plug 'dense-analysis/ale'

Plug 'vito-c/jq.vim'

Plug 'hashivim/vim-terraform'
Plug 'dcharbon/vim-flatbuffers'
Plug 'rkitover/vimpager'
Plug 'FooSoft/vim-argwrap/'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'christoomey/vim-sort-motion'

Plug 'universal-ctags/ctags'
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'

Plug 'junegunn/gv.vim'

Plug 'godlygeek/tabular'

Plug 'editorconfig/editorconfig-vim'

Plug 'ruanyl/vim-sort-imports'

Plug 'lepture/vim-velocity'

Plug 'neo4j-contrib/cypher-vim-syntax'

Plug 'lervag/vimtex'

Plug 'delphinus/vim-firestore'

Plug 'raimon49/requirements.txt.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'AndrewRadev/splitjoin.vim'

Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}

Plug 'styled-components/vim-styled-components'

call plug#end()
