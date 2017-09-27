# make atom the default editor
# keep the main process in the foreground
export EDITOR="atom --foreground"

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

alias ls="ls -l"

# depends on git
alias s="git st"
alias c="git ci"
alias a="git add"
alias d="git diff"

# As recommended by `brew install bash-completion`
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Fancy git prompt
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto,verbose"
GIT_PS1_SHOWCOLORHINTS=1
PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# Append vs overwrite bash history
shopt -s histappend;

# Ignore duplicates in bash history
export HISTCONTROL=ignoredups

# Big bash history
export HISTSIZE=10000
export HISTFILESIZE=10000

eval "$(rbenv init -)"

export PATH=".bundle/bin:$PATH"
export PATH="~/bin:$PATH"
