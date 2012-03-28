alias ls="ls -l"

# depends on rubygems
alias gi="gem install"
alias go="gem open"

# depends on the bundler gem
# bundle exec is provided as a *function* `be`
alias bi="bundle install --path .bundle/gems --binstubs .bundle/bin"
alias bo="bundle open"
alias bc="bundle console"
alias bu="bundle update"

# depends on git
alias s="git st"
alias c="git ci"
alias a="git add"
alias d="git diff"

# depends on being in the root of a rails v3 app
alias sc="script/rails c"
alias ss="script/rails s"
alias sg="script/rails g"
alias db="script/rails db -p"

# depends on the freerange-cli gem
alias fr="freerange"

# the following relies on the `be` *function*
alias ruby='be ruby'
alias irb='be irb'