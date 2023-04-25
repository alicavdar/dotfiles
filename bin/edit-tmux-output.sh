#!/bin/bash

file=`mktemp`.sh
tmux capture-pane -pS -32768 > $file
tmux new-window -n logs "nvim -c ':g/^$/d' $file"
