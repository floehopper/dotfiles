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

CUCUMBER_FORMAT=progress
export CUCUMBER_FORMAT

# Boot rbenv if it exists
if [ -s ~/.rbenv ] ; then eval "$(rbenv init -)" ; fi
