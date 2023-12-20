# Navigation
# l = long list; t = time modified; h = human readable (1K, 234M);
# G = don't list group; r = reverse sort;
# p = append '/' indicator to directories
# a = all including . files
# Useful but not included options:
# S = sort by file size; g = don't list owner
# s = size in Kb instead of blocks
# alias ll="ls -ltrhGp"
alias ll="ls -lhGp -color"
# alias ls='ls -hFG -color'
alias p='pwd'
alias hn='hostname'
alias vi='vim'
alias grep='grep --color --exclude={.nfs*,tags,cscope*}'


# Directory shortcuts
alias chlorine='ssh bupadhyayula@chlorine -Y'
alias pan='cd /Volumes/bupadhyayula/pan/'
alias lam='cd /Volumes/bupadhyayula/pan/saas/main/src/apps/lambda'
alias orc='cd /Volumes/bupadhyayula/pan/saas/main/src/apps/orchestrator'
alias plug='cd /Volumes/bupadhyayula/pan/plugins/security-aas/main/'
alias clientlib='cd /Volumes/bupadhyayula/pan/saas/main/src/apps/clientlib/gpcs4'

alias pan2='ssh root@10.3.223.226'
alias pan3='ssh root@10.3.220.15'
alias test-jump='ssh test@10.3.250.150'

alias fwaas='cd /Users/bupadhyayula/fwaas/; source .venv/bin/activate'

alias vmseries-credentials='cd ~/gimme-aws-creds/;\
                            source .venv/bin/activate;\
                            gimme-aws-creds --profile bupadhyayula_sso-admin_vmseries-dev;\
                            cd ~/fwaas/;\
                            source .venv/bin/activate;'

# Following works when GNU tools is installed on Mac OSX. The whitespace, \t, \+
# and all are understood by GNU regex parser (I think)
# alias trail_ws="sed -i '' 's/[ \t]\+$//'"

# Following works WITHOUT GNU tools installation, on plain/vanilla Mac OSX
# shell.
alias trail_ws="sed -i '' 's/[[:space:]]\{1,\}$//g'"

alias git_clean_ws="git status --short | awk '{print $2}' | xargs sed --in-place 's/[[:space:]]\+$//'"

alias gsl='git shortlog -s -n --all --no-merges'

alias aws-cred='VIRTUAL_ENV="/home/bupadhyayula/gimme-aws-creds/.venv" /home/bupadhyayula/gimme-aws-creds/.venv/bin/python /home/bupadhyayula/gimme-aws-creds/.venv/bin/gimme-aws-creds --profile bupadhyayula_AWS-Universal-IDP'

alias lg='lazygit'

# Following is required for vim-airline plugin to work inside Tmux
# export TERM=screen-256color

# Colorize man pages
# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Set a prompt. Just time.
PS1='\@-$ '

# This code is from Github site. It launches ssh-agent and adds ssh-key to it.
# By doing this, we don't have to type password everytime we do 'git pull'
# https://help.github.com/articles/working-with-ssh-key-passphrases/
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bupadhyayula/google-cloud-sdk/path.bash.inc' ]; then . '/Users/bupadhyayula/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bupadhyayula/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/bupadhyayula/google-cloud-sdk/completion.bash.inc'; fi
source "$HOME/.cargo/env"

# Git autocomplete
if [ -f ~/.git-completion ]; then
        . ~/.git-completion
fi

