RBENVDIR="$HOME/.rbenv"
PATH="$HOME/bin:$RBENVDIR/bin:$PATH"
export PATH

EDITOR="vim"
export EDITOR

GEM_EDITOR=$EDITOR
export GEM_EDITOR

BUNDLER_EDITOR=$EDITOR
export BUNDLER_EDITOR

GIT_EDITOR=$EDITOR
export GIT_EDITOR

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
LESS="-R"
export LESS

CUCUMBER_FORMAT=progress
export CUCUMBER_FORMAT

# Ruby/Rails performance tweaks as per https://gist.github.com/1688857
# Supposedly better Rails performance at the cost of increased memory use
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

RBENV_VERSION="1.9.3-p0-perf"
export RBENV_VERSION

# Boot rbenv if it exists
if [ -s ~/.rbenv ] ; then eval "$(rbenv init -)" ; fi
