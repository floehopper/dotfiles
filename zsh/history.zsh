# path to file in which to store shell command history
HISTFILE=~/.zhistory
# number of lines the shell will keep within one session
HISTSIZE=100000
# total number of lines of your history you want saved
SAVEHIST=100000

# as each line is added, the history file is checked to see if anything was written out by another shell, and if so it is included in the history of the current shell too. This means that zsh's running in different windows but on the same host (or more generally with the same home directory) share the same history.
setopt SHARE_HISTORY
# removes copies of lines still in the history list, keeping the newly added one
setopt HIST_IGNORE_ALL_DUPS
# tidies up the line when it is entered into the history by removing any excess blanks that mean nothing to the shell
setopt HIST_REDUCE_BLANKS
# tells the shell not to store history or fc commands
setopt HIST_NO_STORE

# Search backward in the history for a line beginning with the current line up to the cursor. This leaves the cursor in its original position.
# mapped to up-arrow key
bindkey "\e[A" history-beginning-search-backward
# Search forward in the history for a line beginning with the current line up to the cursor. This leaves the cursor at its original position.
# mapped to down-arrow key
bindkey "\e[B" history-beginning-search-forward