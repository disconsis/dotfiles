#!/usr/bin/zsh

num_sess=$(tmux list-sessions | wc -l)

if [ $num_sess -eq 0 ]; then
    # echo "creating base session"
    i3-sensible-terminal -e tmux new-session base
else
    # echo "creating session ${sess_name}"
    sess_name="new_${num_sess}"
    i3-sensible-terminal -e tmux new-session $sess_name
fi
