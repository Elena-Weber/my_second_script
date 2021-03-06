#! /bin/bash

echo
echo " - - - - - - - - - - - - - - - "
echo
echo "Hi! My name is SCRIPT-THE-SECOND and I was created by Elena Weber."
echo "My job is to help you search for any word you want, and I love it!"
echo "I look through all the files and folders in the current folder."
echo
echo "Let's start! :)"
echo

# display all the folders and files (excl. *sh and hidden ones)
echo "Here is the list of all folders and files I've found in the current folder:"
echo
find . -type f ! -name '*.sh' ! -path '*/\.*' -exec echo "* {}" \;
echo

# count all files excluding hidden files and folders
total=$(find . -type f ! -path '*/\.*' ! -name '*.sh' | wc -l)
echo "Total: $total files"
echo

# set up the searched word
read -p "What word are you looking for? " searchword
echo

myfunction(){
    if [ -z $searchword ]; then # if user doesn't type anything
        echo "I'm sorry I didn't get it."
        echo
    else
        echo "Searching for -> $searchword <- :"
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

    read -p "Would you like to search for another word? (y/N) " answer
    echo
    case $answer in
        "" | "n" | "N")
            echo "No problem. Thanks for using me! Have a great one!"
            echo
            echo " - - - - - - - - - - - - - - - "
            echo
            ;;
        "y" | "Y")
            read -p "What word are you looking for? " searchword
            echo
            myfunction
            ;;
        *)
            echo "I'm sorry I don't understand. Thanks for using me! Have a great one!"
            echo
            echo " - - - - - - - - - - - - - - - "
            echo
            ;;
    esac
}

echo
myfunction