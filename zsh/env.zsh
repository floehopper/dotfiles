export EDITOR="mate2 -w"
export GEM_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

export VMAIL_BROWSER='elinks'
export VMAIL_HTML_PART_READER='elinks -dump'

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

#export CUCUMBER_FORMAT="progress"

# Ruby performance tweaks from @zetter


export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Changes needed for Ruby 2.1
# export RUBY_FREE_MIN=$RUBY_HEAP_FREE_MIN
export RUBY_GC_HEAP_FREE_SLOTS=$RUBY_HEAP_FREE_MIN
# export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000

export IPLAYER_OUTDIR="Downloads"

# For Mono/FSharp
export MONO_GAC_PREFIX="/usr/local"


eval "$(rbenv init -)"

export PATH=".bundle/bin:~/node_modules/.bin/:$HOME/bin:/usr/local/heroku/bin:$PATH"

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
