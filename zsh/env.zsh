export EDITOR="vim"
export GEM_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

export VMAIL_BROWSER='elinks'
export VMAIL_HTML_PART_READER='elinks -dump'

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

export CUCUMBER_FORMAT=progress

# Ruby/Rails performance tweaks as per https://gist.github.com/4524945
# Supposedly better Rails performance at the cost of increased memory use
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000

eval "$(rbenv init -)"

export PATH=".bundle/bin:$HOME/bin:/usr/local/heroku/bin:$PATH"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
