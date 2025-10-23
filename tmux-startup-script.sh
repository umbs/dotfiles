#/usr/bin/tmux source-file /path/to/config/file

tmux start-server

# LOCAL session
tmux new-session -d -s local -n 'Todo'
tmux send-keys "nvim -p $HOME/Dropbox/Todo.txt $HOME/Dropbox/WorkTodo.txt" C-m

tmux new-window -t local:1 -n 'Journal'
tmux send-keys "nvim $HOME/Notes/Journal.txt" C-m

tmux new-window -t local:2 -n 'scratch'
tmux send-keys "nvim $HOME/Dropbox/scratch.txt" C-m

tmux new-window -t local:3 -n 'Notes'
tmux send-keys "cd $HOME/Notes" C-m

tmux new-window -t local:4 -n 'practice'
tmux send-keys "cd $HOME/practice" C-m

tmux new-window -t local:5 -n 'misc'

tmux new-window -t local:6 -n 'code'
tmux new-window -t local:7 -n 'mtlsproxy'
tmux new-window -t local:8 -n 'runzos'
tmux new-window -t local:9 -n 'vimhelp'

tmux attach -t local
