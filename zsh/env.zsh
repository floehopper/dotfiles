export PATH=".bundle/bin:$HOME/bin:$PATH"

export EDITOR="vim"
export GEM_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

export CUCUMBER_FORMAT=progress

# Ruby/Rails performance tweaks as per https://gist.github.com/1688857
# Supposedly better Rails performance at the cost of increased memory use
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

eval "$(rbenv init -)"
