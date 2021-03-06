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
alias ls='ls -hFG -color'
alias p='pwd'

# Following works when GNU tools is installed on Mac OSX. The whitespace, \t, \+
# and all are understood by GNU regex parser (I think)
# alias trail_ws="sed -i '' 's/[ \t]\+$//'"

# Following works WITHOUT GNU tools installation, on plain/vanilla Mac OSX
# shell.
alias trail_ws="sed -i '' 's/[[:space:]]\{1,\}$//g'"

alias git_clean_ws="git status --short | awk '{print $2}' | xargs sed --in-place 's/[[:space:]]\+$//'"

# http://vim.wikia.com/wiki/Converting_tabs_to_spaces
# https://howchoo.com/g/m2u0nthkyti/vim-convert-tabs-to-spaces
# tabstop = How many columns a tab counts for
# shiftwidth = How many columns text is indented with, when using reindent operation
# expandtab = Use space instead of tab
set tabstop=4 shiftwidth=4 expandtab

# in a file that already has tabs, first set above properties and then do
# :retab

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
