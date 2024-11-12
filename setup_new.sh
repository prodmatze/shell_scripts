#!/bin/bash

# Create a new tmux session named "session_new" and detach
tmux new-session -d -s session_new

#create 1st window for nvim 
tmux rename-window -t session_new:0 'editor'
tmux send-keys -t session_new:0 "source ./venv/bin/activate" C-m
tmux send-keys -t session_new:0 "export OPENAI_API_KEY=$(<~/.openai_api_key_nvim)" C-m
tmux send-keys -t session_new:0 "clear" C-m

#create 2nd window for running etc
tmux new-window -t session_new:1 -n 'server'
tmux send-keys -t session_new:1 "source ./venv/bin/activate" C-m
tmux send-keys -t session_new:1 "clear" C-m

#create 3rd window for git
tmux new-window -t session_new:2 -n 'git'
tmux send-keys -t session_new:2 "source ./venv/bin/activate" C-m
tmux send-keys -t session_new:2 "clear" C-m
tmux send-keys -t session_new:2 'lazygit' C-m

tmux select-window -t session_new:0



# Attach to the tmux session
tmux attach -t session_new
