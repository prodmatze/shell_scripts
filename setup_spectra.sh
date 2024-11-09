#!/bin/bash

# Create a new tmux session named "session_spectra" and detach
tmux new-session -d -s session_spectra

#create 1st window for nvim 
tmux rename-window -t session_spectra:0 'editor'
tmux send-keys -t session_spectra:0 'cd ~/projects/spectra-ai' C-m
tmux send-keys -t session_spectra:0 "source ./venv/bin/activate" C-m
tmux send-keys -t session_spectra:0 "clear" C-m 

 
#create 2nd window for running etc
tmux new-window -t session_spectra:1 -n 'server'
tmux send-keys -t session_spectra:1 'cd ~/projects/spectra-ai' C-m
tmux send-keys -t session_spectra:1 "source ./venv/bin/activate" C-m
tmux send-keys -t session_spectra:1 "clear" C-m


#create 3rd window for git
tmux new-window -t session_spectra:2 -n 'git'
tmux send-keys -t session_spectra:2 'cd ~/projects/spectra-ai' C-m
tmux send-keys -t session_spectra:2 "source ./venv/bin/activate" C-m
tmux send-keys -t session_spectra:2 "clear" C-m
tmux send-keys -t session_spectra:2 'lazygit' C-m

tmux select-window -t session_spectra:0


# Attach to the tmux session
tmux attach -t session_spectra

