#/usr/bin/tmux source-file /path/to/config/file

tmux start-server

tmux new-session -d -s local -n 'Todo'
tmux send-keys "vi ~/Dropbox/Todo.txt" C-m

tmux new-window -t local:1 -n 'Journal'
tmux send-keys "vi ~/Dropbox/Journal.txt" C-m

tmux new-window -t local:2 -n 'scratch'
tmux send-keys "vi ~/scratch.txt" C-m

tmux new-window -t local:3 -n 'CCNA'
tmux send-keys "vi ~/github/Notes/CCNA.txt" C-m

tmux new-window -t local:4 -n 'misc'

tmux attach -t local
