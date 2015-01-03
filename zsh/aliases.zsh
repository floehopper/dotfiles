alias e="mate2 ."
alias ls="ls -l"

# depends on rubygems
# alias gi="gem install"
# alias go="gem open" # conflicts with go language

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

# the following relies on the `be` *function*
alias ruby='be ruby'
alias irb='be irb'


alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'