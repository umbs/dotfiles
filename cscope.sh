#!/bin/bash
echo "====>Remove old cscope files"
rm -f cscope*

echo "====>Build cscope.files"
# If directories needs to be excluded, add following command
# '-prune' '-o -type d -name <dir-name> -prune'
find -L $PWD -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.py' > cscope.files

echo "====>Build cscope database"
cscope -b -q -R
