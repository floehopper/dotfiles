" TODO
"
" [ ] Run all tests in separate tmux pane
" [x]   ActiveSupport
" [x]     view_test
" [x]   Cucumber
" [ ]   Test::Unit
" [ ]   MiniTest
" [ ]   RSpec
" [x]   MiniTest::Spec
"
" [ ] Run *focussed* test in separate tmux pane
" [x]   ActiveSupport
" [x]     view_test
" [x]   Cucumber
" [ ]   Test::Unit
" [ ]   MiniTest
" [ ]   RSpec
" [ ]   MiniTest::Spec
"
" [ ] See list of buffers so I can easily switch to them (pretty much decided
" tabs are not useful for this). I thought that vim-bufstat might be a good
" solution, but now I'm not so sure.
"
" [x] Sort out copying and pasting from within tmux/iterm.
"
" [ ] Sort out some standard tmux layouts and make it easy to setup.
"
" [ ] Work out best remote pairing option e.g. wemux?

" vundler
"
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
"
" use `vim +<command> +qa` to install new plugins from command line


" disable compatibility with legacy vi - we're living in the future!
set nocompatible

" not sure what this is for, but maybe vundle needs it we enable it later
filetype off

" add vundle directory to runtime path
set rtp+=~/.vim/bundle/vundle/

" initialize vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'

Bundle 'tpope/vim-fugitive'

Bundle 'gregsexton/gitv'
Bundle 'mileszs/ack.vim'

" adds a Qargs (and Qdo) command, for populating the argument list from the
" files in the quickfix list - useful for search and replace based on results
" from Ack search e.g. Qdo %s/old/new/ge | update
Bundle 'henrik/vim-qargs'

Bundle 'tpope/vim-cucumber'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'tpope/vim-unimpaired'

Bundle 'chriskempson/vim-tomorrow-theme'

" Fuzzy file, buffer, mru, tag, etc finder.
Bundle 'kien/ctrlp.vim'

" Send command from vim to a running tmux session
Bundle 'jgdavey/tslime.vim'

" vimux is an alternative to tslime, but i kept getting seg faults when
" installing it - even when i removed all other plugins.  this github issue
" seems relevant - https://github.com/benmills/vimux/issues/47.  vim-turbux
" supports both vimux and tslime and i wanted to see whether vimux fixed a
" problem i was having with the escaping of quotes being sent to tmux by
" vim-turbux on running a focussed test.
"
" Bundle 'benmills/vimux'

" Run all tests or a focussed test by sending a command via tslime or vimux to
" another tmux pane or session.
" Bundle 'jgdavey/vim-turbux'

" This is my hacked version of tmux which makes running focussed tests work
" for @h-lame's view_test in alphagov/whitehall.
" Bundle 'floehopper/vim-turbux'

Bundle 'janx/vim-rubytest'

" I had hoped this was the answer to me wanting to see all the currently open
" buffers - it displays them in the status line, but i'm not sure it does a very
" good job when there are a lot of buffers open. Also it seems to set up a
" mapping for the left and right arrow keys which is annoying.
" Bundle 'rson/vim-bufstat'

" vim script internal debugger (output in separate window, tab, or remote vim)
Bundle 'vim-scripts/Decho'

" status bar goodies
Bundle 'Lokaltog/vim-powerline'


" enable file type detection for syntax highlighting, vim plugins & indent rules
filetype plugin indent on

" start syntax highlighting
syntax on

" force encoding to be UTF-8
set encoding=utf-8

colorscheme Tomorrow-Night

" show information about the current command including size of selection in
" visual mode
set showcmd

" always display status line
set laststatus=2
" add status info from figitive plugin
" set statusline=%{fugitive#statusline()}
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
" because it is provided by the powerline statusline anyway
set noshowmode

" while typing a search command, show where the pattern, as it was typed so far,
" matches.
set incsearch
" highlight search matches
set hlsearch
" case insensitive search
set ignorecase
" case sensitive search if pattern includes any capital letters
set smartcase

" allow backspacing over autoindent allow backspacing over line breaks (join
" lines) allow backspacing over the start of insert
set backspace=indent,eol,start

" insert space characters whenever the tab key is pressed
set expandtab
" number of space characters that will be inserted when the tab key is pressed
set tabstop=2
" number of space characters inserted for indentation
set shiftwidth=2

" don't automatically wrap long lines
set nowrap

" avoid a pinky stretch to the '\' key
let mapleader=","
let localmapleader=","

" 10x the default history for e.g. commands, search, etc
set history=10000

" the current buffer can be put to the background without writing to disk when a
" background buffer becomes current again, marks and undo-history are remembered
set hidden

" use the system clipboard by default for copy & paste operations
set clipboard=unnamed

" display all possible file/command completions
set wildmenu

" include underscore character as a word delimiter
set iskeyword-=_

" ensure powerline statusline is updated as soon as visual mode is exited
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0

let g:rubytest_in_quickfix=1

