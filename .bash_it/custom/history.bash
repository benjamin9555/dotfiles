#!/usr/bin/env bash

# Increase bash history size
export HISTSIZE=10000000
export HISTFILESIZE=10000000

### Shared bash history for multiple terminal windows
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
