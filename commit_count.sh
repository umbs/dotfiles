#!/bin/bash -
#===============================================================================
#
#          FILE: commit_count.sh
#
#         USAGE: ./commit_count.sh
#
#   DESCRIPTION: Gives a count of commits across all branches in a list of
#   repos. Search uses git log and email address to search history.
#
#          TODO: Replace base-path-directory and email-id with correct values
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (),
#  ORGANIZATION:
#       CREATED: 09/03/2018 09:32
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

BASE=<base-path-directory>
COUNTER=0

function git_cmd() {
    git log --all --author=<email-id> --pretty=oneline | wc -l
}

repos=( "$BASE/<repo-1>"
        "$BASE/<repo-2>"
        "$BASE/<repo-3>"
        )

printf "****************************************\n"
printf "    Repo Name           # of Commits\n"
printf "****************************************\n"

for i in "${repos[@]}"
do
    cd "$i" || echo "Repo $i doesn't exist. Moving to next repo ..."
    COUNT=$(git_cmd)
    COUNTER=$((COUNTER + COUNT))
    printf "    %-20s  %s\n" "$(basename "$i")" "$COUNT"
done

printf "    =========================\n"
printf "    Total Repos           %s\n" "${#repos[@]}"
printf "    Total Commits         %s\n" "$COUNTER"
