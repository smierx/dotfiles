#!/bin/sh
SESSION="Work"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

#PROJEKT PATHS
ANKI="$HOME/anki_cli"

if [ "$SESSIONEXISTS" =  "" ]
then
  tmux new-session -d -s $SESSION
  tmux rename-window -t 0 "config"

  tmux new-window -t $SESSION:1 -n "anki-cli"
  tmux send-keys -t "anki-cli" "cd $ANKI" C-m
  tmux split-window -t $SESSION:1 -h
  tmux send-keys -t "anki-cli" "cd $ANKI" C-m


fi
tmux attach-session -t $SESSION:0
