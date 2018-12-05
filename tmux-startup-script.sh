#/usr/bin/tmux source-file /path/to/config/file

tmux start-server

tmux new-session -d -s local -n 'Todo'
tmux send-keys "vi -p ~/Box/Todo.txt ~/Box/WorkTodo.txt" C-m

tmux new-window -t local:1 -n 'Journal'
tmux send-keys "vi ~/Box/Journal.txt" C-m

tmux new-window -t local:2 -n 'scratch'
tmux send-keys "vi ~/Box/scratch.txt" C-m

tmux new-window -t local:3 -n 'blogs'
tmux send-keys "vi ~/Box/Blog\ Drafts/Misc.txt" C-m

tmux new-window -t local:4 -n 'practice'

tmux new-window -t local:5 -n 'misc'

tmux attach -t local
