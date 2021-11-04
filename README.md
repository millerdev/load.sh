# Bash Environment Loader

Functions for a `load` command, which is used to initialize a named
environment. Write a single script and avoid typing a sequence of commands in
each terminal tab to get it initialized for work, thus reducing that sequence
of commands to a single command. An environment script can contain one or more
commands such as `cd ~/code/project` and/or `workon project`. The environment
script will be sourced in the current bash environment when its corresponding
load command is executed with `load project`.

## Setup/installation

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/millerdev/load.sh/master/install.sh)"
```

## Manual setup

```
git clone https://github.com/millerdev/load.sh
LOAD_HOME=~/.local/bin/load  # may be customized
mkdir $LOAD_HOME
cp load.sh/load.sh $LOAD_HOME/.load.sh
echo "export LOAD_HOME=$LOAD_HOME" >> ~/.bashrc
echo 'source $LOAD_HOME/.load.sh' >> ~/.bashrc
```

## Credit

This script was adapted from the workon and tab completion functions of
virtualenvwrapper.
