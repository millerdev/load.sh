#!/usr/bin/env bash
#
# Functions for a `load` command, which is used to initialize a named
# environment. Write a single script and avoid typing a sequence of commands in
# each terminal tab to get it initialized for work, thus reducing that sequence
# of commands to a single command. An environment script can contain one or more
# commands such as `cd ~/code/project` and/or `workon project`. The environment
# script will be sourced in the current bash environment when its corresponding
# load command is executed with `load project`.
#
# ## Installation
#
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/millerdev/load.sh/master/install.sh)"
#
# See https://github.com/millerdev/load.sh for other options.

if [ -z "$LOAD_HOME" ]; then
    LOAD_HOME="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
fi

function load {
    in_args=( "$@" )

    if [ -n "$ZSH_VERSION" ]; then
        i=1
        tst="-le"
    else
        i=0
        tst="-lt"
    fi
    while [ $i $tst $# ]; do
        a="${in_args[$i]}"
        case "$a" in
            -h|--help)
                echo "load [-h|--help|ENVIRONMENT]";
                echo ""
                echo "Create environment scripts in $LOAD_HOME"
                return 0;;
        esac
        i=$(( $i + 1 ))
    done

    typeset loader="$1"
    if [ "$loader" = "" ]
    then
        ls $LOAD_HOME
        return 1
    fi

    test -f $LOAD_HOME/$loader || return 1

    source "$LOAD_HOME/$loader"
    return 0
}

function setup_tab_completion {
    # for bash
    _loaders () {
        local cur="${COMP_WORDS[COMP_CWORD]}"
        COMPREPLY=( $(compgen -W "`ls $LOAD_HOME`" -- ${cur}) )
    }
    complete -o default -o nospace -F _loaders load
}

setup_tab_completion
