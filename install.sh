#!/usr/bin/env bash
if [ -z "$LOAD_HOME" ]; then
    if [ -d $HOME/bin/load ]; then
        LOAD_HOME=$HOME/bin/load
    else
        LOAD_HOME=$HOME/.local/bin/load
    fi
fi
mkdir -p $LOAD_HOME
curl -fsSL https://raw.githubusercontent.com/millerdev/load.sh/master/load.sh > $LOAD_HOME/.load.sh
echo "Add the following lines to your bash profile:"
echo ""
echo "  export LOAD_HOME=$LOAD_HOME"
echo '  source $LOAD_HOME/.load.sh'
