alias e="mate ."
alias ls="ls -l"

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

# the following relies on the `be` *function*
alias ruby='be ruby'
alias irb='be irb'


alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'