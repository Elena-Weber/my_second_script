#! /bin/bash

echo
echo "Hi! My name is BASH-SHELL-SCRIPT-THE-SECOND and I was created by Elena Weber."
echo

# display all the folders and files
# echo "Here is the list of all folders and files in the current folder:"
# echo
# for anything in * ;
# for anything in $(find . ! -path '*/\.*') ;
# do
#     namefile=$(basename "$anything")
#     echo " * "$anything""
#     echo "$namefile"
# done

read -p "What word are you looking for? " searchrequest
echo "$searchrequest"

echo
echo "Searching in all folders and files (excl. hidden ones):"
echo

# exclude any hidden files and folders from search
for folder in $(find . -type d ! -path '*/\.*') ;
do
    # if [ $folder != "./.git" ]; then
        echo "-> -> -> Searching in folder: $folder <- <- <-"
        echo
        for anything in $folder/* ;
        do
            if [ -f "$anything" ]; then
                # grep = find
                # -n = show the line on which the word is
                # -i = ignore big/small letters in search
                searched=$(grep -ni "once" "$anything")
                if [ -z "$searched" ]; then
                    filename=$(basename "$anything")
                    echo "NOT found in -> "$filename" <-"
                    echo
                else
                    filename=$(basename "$anything")
                    echo "FOUND in -> "$filename" <- on line:"
                    echo "$searched"
                    echo
                fi
            fi
        done
    # fi
    echo
done