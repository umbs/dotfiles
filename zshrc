PROMPT='[%T] '

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

# Following works when GNU tools is installed on Mac OSX. The whitespace, \t, \+
# and all are understood by GNU regex parser (I think)
# alias trail_ws="sed -i '' 's/[ \t]\+$//'"

# Following works WITHOUT GNU tools installation, on plain/vanilla Mac OSX
# shell.
alias trail_ws="sed -i '' 's/[[:space:]]\{1,\}$//g'"

