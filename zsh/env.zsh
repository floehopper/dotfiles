export EDITOR="mate -w"
export GEM_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

# Prevent less from escaping xterm color control
# characters that appear in Rails log file
export LESS="-R"

# For Mono/FSharp
export MONO_GAC_PREFIX="/usr/local"


eval "$(rbenv init -)"

export PATH=".bundle/bin:~/node_modules/.bin/:$HOME/bin:/usr/local/heroku/bin:$PATH"
