#! /bin/bash

echo
echo "Hi! My name is BASH-SHELL-SCRIPT and I was created by Elena Weber."
echo

# display all the folders and files in the current folder
echo "Here is the list of all folders and files in the current folder:"
echo
for anyfile in *;
do
    echo "* $anyfile"
done

echo
echo "Let's take a closer look!"
echo

# for-loop going through all files in current folder
# grep = find
# -n = show the line on which the word is
# -i = do not pay attention to capital/small letters in search
for anyfile in *;
do
    if [ -f "$anyfile" ]; then
        echo "+ $anyfile is a file"
        grep -ni "once" "$anyfile"
    else
        echo "+ $anyfile is a folder"
    fi
done
echo

# for anyfile in *;
# do
#     if [ -f "$anyfile" ]; then
#         echo "+ $anyfile is a file"
#         # grep -ni "once" "$anyfile"
#         present=$(grep -ni "once" "$anyfile")
#         if [ -z "$present" ]; then
#             echo "The searched word was NOT found"
#         else
#             echo "The searched word was found"
#         fi
#     else
#         echo "+ $anyfile is a folder"
#     fi
# done

echo
echo "All files and folders:"
echo

# exclude any hidden files and folders
for eachff in $(find . -type d ! -path '*/\.*') ;
do
    if [ $eachff != "./.git" ]; then
        echo "*** Searching in folder: $eachff ***"
        for myfile in $eachff/* ;
        do
            if [ -f "$myfile" ]; then
                echo "This file's path: $myfile"
                present=$(grep -ni "once" "$myfile")
                if [ -z "$present" ]; then
                    filename=$(basename "$myfile")
                    echo "The searched word was NOT found in "$filename""
                    echo
                else
                    filename=$(basename "$myfile")
                    echo "The searched word was FOUND in "$filename""
                    # echo "$filename"
                    echo
                fi
            fi
        done
    fi
    echo
done