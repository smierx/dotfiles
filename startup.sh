#!/bin/sh
SESSION="Work"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

#PROJEKT PATHS
ANKI="$HOME/anki_cli"
CONFIG="$HOME/.config"
QMK="$HOME/qmk_firmware"
QMKLAYOUT="$QMK/keyboards/splitkb/aurora/lily58/keymaps/smierx-colemak-dh"
QMKSCRIPTS="$QMK/scripts"

if [ "$SESSIONEXISTS" =  "" ]
then
  tmux new-session -d -s $SESSION
  tmux rename-window -t 0 "config"
  tmux send-keys -t "config" "cd $CONFIG" C-m 

  tmux new-window -t $SESSION:1 -n "anki-cli"
  tmux send-keys -t "anki-cli" "cd $ANKI" C-m
  tmux split-window -t $SESSION:1 -h
  tmux send-keys -t "anki-cli" "cd $ANKI" C-m

  tmux new-window -t $SESSION:2 -n "qmk"
  tmux send-keys -t "qmk" "cd $QMKLAYOUT" C-m
  tmux split-window -t $SESSION:2 -h
  tmux send-keys -t "qmk" "cd $QMKSCRIPTS" C-m

fi
tmux attach-session -t $SESSION:0
