#! /bin/bash

echo
echo "Hi! My name is BASH-SCRIPT and I was created by Elena Weber."
echo

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
    if [ -f $anyfile ]; then
        echo "$anyfile is a file"
    else
        echo "$anyfile is a folder"
    fi
done