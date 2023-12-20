#/usr/bin/tmux source-file /path/to/config/file

FOLDER=/Users/bupadhyayula/Dropbox

tmux start-server

tmux new-session -d -s local -n 'Todo'
tmux send-keys "nvim -p $FOLDER/Todo.txt $FOLDER/WorkTodo.txt" C-m

tmux new-window -t local:1 -n 'Journal'
tmux send-keys "nvim $FOLDER/Journal.txt" C-m

tmux new-window -t local:2 -n 'scratch'
tmux send-keys "nvim $FOLDER/scratch.txt" C-m

tmux new-window -t local:3 -n 'Notes'
tmux send-keys "cd $HOME/Notes" C-m

tmux new-window -t local:4 -n 'practice'
tmux send-keys "cd $HOME/practice" C-m

tmux new-window -t local:5 -n 'misc'

tmux new-window -t local:6 -n 'code'
tmux new-window -t local:7 -n 'build'

tmux attach -t local

