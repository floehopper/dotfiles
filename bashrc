# suppress deprecation warning for using bash shell vs zsh on MacOS Catalina
# see: https://support.apple.com/en-us/HT208050
export BASH_SILENCE_DEPRECATION_WARNING=1

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

alias ls="ls -l"

# depends on git
alias s="git st"
alias c="git ci"
alias a="git add"
alias d="git diff"

# depends on docker
alias dc="docker-compose"

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

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"

export PATH="/usr/local/sbin:$PATH" # recommended by `brew doctor`
export PATH=".bundle/bin:$PATH"
export PATH="node_modules/.bin:$PATH"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="~/bin:$PATH"

# Used by Ferrum/Cuprite
export BROWSER_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# Automatically added by running `$(brew --prefix)/opt/fzf/install`
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# asdf version management
. $(brew --prefix asdf)/libexec/asdf.sh

# bundler performance
CORES=`sysctl -n hw.ncpu 2>/dev/null || nproc` #mac & linux
MAKEFLAGS="-j$CORES"; export MAKEFLAGS
BUNDLE_JOBS="$CORES"; export BUNDLE_JOBS
