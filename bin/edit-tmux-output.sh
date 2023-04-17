#!/bin/bash

file=`mktemp`.sh
tmux capture-pane -pS > $file
tmux new-window -n logs "nvim -c ':g/^$/d' $file"
