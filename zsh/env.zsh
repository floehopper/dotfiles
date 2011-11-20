RBENVDIR="$HOME/.rbenv"
PATH="$HOME/bin:$RBENVDIR/bin:$PATH"
export PATH

# Boot rbenv if it exists
if [ -s ~/.rbenv ] ; then eval "$(rbenv init -)" ; fi
