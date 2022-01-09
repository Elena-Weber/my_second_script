Hello!

This script can help you find a word or a letter combination in all the files in the folder where the script is. It's a little search engine (please note that the search doesn't include hidden files and folders).

### How to install

Clone this repo, cd into that folder and run this command in your terminal:
#### ./testscript.sh
If everything is successful, you should see a greeting from the "bot" in the terminal. Follow the prompts and check it out.

### In case you get a "permission denied" message

If you see this message:
#### zsh: permission denied: ./testscript.sh
That simply means that you computer blocked the execution of the script. It's ok, mine did that too. Just a safety feature.
To fix it, you need to allow execution of the script on your machine. Run this in your terminal:
#### chmod +x testscript.sh
This command will allow execution of the script and you only need to do it once (the very first time). After that, try
#### ./testscript
in your terminal again. Voila!
