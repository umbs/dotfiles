# tmux sessions 
function tmux-profile
{
        PROFILE="$HOME/trees/profile"
        cd $PROFILE

        tmux start-server
        tmux new-session -d -s profile -n parser
        tmux new-window -t profile:1 -n cli
        tmux new-window -t profile:2 -n mgr  
        tmux new-window -t profile:3 -n daemon 
        tmux new-window -t profile:4 -n fabl  
        tmux new-window -t profile:5 -n misc 

        tmux attach-session -t profile
}

function tmux-src
{
        SRC="$HOME/trees/swfeature_int"
        cd $SRC

        tmux start-server
        tmux new-session -d -s src -n parser
        tmux new-window -t src:1 -n cli
        tmux new-window -t src:2 -n mgr  
        tmux new-window -t src:3 -n daemon 
        tmux new-window -t src:4 -n fabl  
        tmux new-window -t src:5 -n misc 

        tmux attach-session -t src
}

function tmux-personal
{
        SRC="$HOME/github"
        cd $SRC

        tmux start-server
        tmux new-session -d -s personal -n code 
        tmux new-window -t personal:1 -n make 
        tmux new-window -t personal:2 -n linux 
        tmux new-window -t personal:3 -n glibc 

        tmux attach-session -t personal
}
