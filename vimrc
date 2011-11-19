set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'git://github.com/tpope/vim-rails.git'
Bundle 'git://github.com/tpope/vim-bundler.git'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/gregsexton/gitv.git'
Bundle 'git://github.com/mattn/gist-vim.git'
Bundle 'git://github.com/mileszs/ack.vim.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/tpope/vim-cucumber.git'
Bundle 'git://github.com/tpope/vim-vividchalk.git'

filetype plugin indent on

syntax on
set background=dark
colorscheme solarized 

set statusline=%{fugitive#statusline()}

set incsearch

map <C-t> <leader>t
map <C-f> :Ack 
