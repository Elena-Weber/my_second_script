#! /bin/bash

echo
echo " - - - - - - - - - - - - - - - "
echo
echo "Hi! My name is SCRIPT-THE-SECOND and I was created by Elena Weber."
echo "My job is to help you search for any word you want, and I love it!"
echo "I look through all the files in the current folder."
echo "Let's start! :)"
echo

# display all the folders and files (excl. *sh and hidden ones)
echo "Here is the list of all folders and files I've found in the current folder:"
echo
find . -type f ! -name '*.sh' ! -path '*/\.*' -exec echo "* {}" \;
echo

# set up the searched word
read -p "What word are you looking for? " searchword
echo
if [ -z $searchword ]; then # if user doesn't type anything
    echo "Please restart the script and type the word you're looking for."
    echo
else
    echo "Searching for -> $searchword <- in all folders and files (excl. hidden ones):"
    echo
    # exclude any hidden files and folders from search
    for folder in $(find . -type d ! -path '*/\.*' ! -name '*.sh') ;
    do
        echo "-> -> -> Searching in folder: $folder <- <- <-"
        echo
        for anything in $folder/* ;
        do
            if [ -f "$anything" ]; then
                # grep = find
                # -n = show the line on which the word is
                # -i = ignore big/small letters in search
                searched=$(grep -ni "$searchword" "$anything")
                if [ -z "$searched" ]; then
                    filename=$(basename "$anything")
                    echo "NOT found in -> "$filename" <-"
                    echo
                else
                    filename=$(basename "$anything")
                    echo "FOUND in -> "$filename" <- on line(s):"
                    echo "$searched"
                    echo
                fi
            fi
        done
        echo
    done
fi

echo "Would you like to search for another word? (y/N)"