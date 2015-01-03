export PATH="$HOME/bin:$PATH"
eval "$(rbenv init -)"

export EDITOR="mate -w"

# don't escape colours in Rails log file
export LESS="-R"

alias gi="gem install"
alias go="gem open"

alias bi="bundle install"
alias be="bundle exec"
alias bo="bundle open"

alias ls="ls -l"

alias fr="freerange"

alias s="git st"
alias c="git ci"
alias a="git add"
alias d="git diff"

alias sc="script/rails c"
alias ss="script/rails s"
alias sg="script/rails g"
