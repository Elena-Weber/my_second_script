#! /bin/bash

echo
echo "Hi! My name is BASH-SCRIPT and I was created by Elena Weber."
echo

# display all the folders and files in the current folder
echo "Here is the list of folders and files in the current folder:"
echo
for anyfile in *;
do
    echo "* $anyfile"
done

echo
echo "Let's take a closer look!"
echo
for anyfile in *;
do
# grep = find
# -n = show the line on which the word is
# -i = not pay attention to capital and small letters in search
    if [ -f "$anyfile" ]; then
        echo "+ $anyfile is a file"
        grep -ni "once" "$anyfile"
    else
        echo "+ $anyfile is a folder"
    fi
done