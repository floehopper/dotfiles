# suppress deprecation warning for using bash shell vs zsh on MacOS Catalina
# see: https://support.apple.com/en-us/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

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

# Save & reload bash history after every command to make
# them available in all shells as soon as possible
# See: https://ss64.com/bash/history.html
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# Append vs overwrite bash history
shopt -s histappend;

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth

# Big bash history
export HISTSIZE=100000
export HISTFILESIZE=10000000

eval "$(rbenv init -)"

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"

export PATH=".bundle/bin:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="~/bin:$PATH"

# Automatically added by Node Version Manager
# https://github.com/creationix/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automatically added by running `$(brew --prefix)/opt/fzf/install`
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
