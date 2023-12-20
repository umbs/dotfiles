#!/bin/bash
echo "====>Remove old cscope & tag files"
rm -f cscope*
rm -f tags
echo "====>DONE"

echo "====>Build cscope.files"
# If directories needs to be excluded, add following command
# '-prune' '-o -type d -name <dir-name> -prune'
find -L $PWD -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.py' > cscope.files
echo "====>DONE"

echo "====>Build cscope database"
cscope -b -q -R
echo "====>DONE"

echo "====>Build ctags"
# --extra=+f allows python libraries in tags file, source StackOverflow
ctags -R --extra=+f --exclude="*.js" --exclude=".git" --exclude="cdk.out" --exclude=".venv" --exclude="venv" .
echo "====>DONE"
