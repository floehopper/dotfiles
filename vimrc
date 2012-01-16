" disable compatibility with legacy vi
set nocompatible

" not sure what this is for, but maybe vundle needs it
" we enable it later
filetype off

" add vundle directory to runtime path
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'git://github.com/tpope/vim-rails.git'
Bundle 'git://github.com/tpope/vim-bundler.git'
" Bundle 'git://git.wincent.com/command-t.git'
" Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/gregsexton/gitv.git'
Bundle 'git://github.com/mattn/gist-vim.git'
Bundle 'git://github.com/mileszs/ack.vim.git'
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle 'git://github.com/tpope/vim-cucumber.git'
" Bundle 'git://github.com/tpope/vim-vividchalk.git'
Bundle 'git://github.com/bronson/vim-trailing-whitespace.git'
Bundle 'git://github.com/tpope/vim-unimpaired.git'
Bundle 'git://github.com/ChrisKempson/Vim-Tomorrow-Theme.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'

" enable file type detection for syntax highlighting,
" vim plugins & indent rules
filetype plugin indent on

" start syntax highlighting
syntax on

" force encoding to be UTF-8
set encoding=utf-8

colorscheme Tomorrow-Night

" show information about the current command
" including size of selection in visual mode
set showcmd

set statusline=%{fugitive#statusline()}

" while typing a search command, show where the pattern, as it was typed so far, matches.
set incsearch
" highlight search matches
set hlsearch
" case insensitive search
set ignorecase
" case sensitive search if pattern includes any capital letters
set smartcase

map <C-t> <leader>t
map <C-f> :Ack

" allow backspacing over autoindent
" allow backspacing over line breaks (join lines)
" allow backspacing over the start of insert
set backspace=indent,eol,start

" insert space characters whenever the tab key is pressed
set expandtab
" number of space characters that will be inserted when the tab key is pressed
set tabstop=2
" number of space characters inserted for indentation
set shiftwidth=2

" don't automatically wrap long lines
set nowrap
