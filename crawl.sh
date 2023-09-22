#!/usr/bin/bash

echo -e "\e[1;44m Welcome to crawl.sh \e[0m"
echo -e "\e[1;44m Paste url's below and hit enter to clone html directly from the web.\e[0m"
echo -e "\e[1;44m Press [Ctrl + C] to escape.\e[0m"

while :                                                                             #   initialise the program
do
    read                                                                            #   read user input, $REPLY with result after ENTER keystroke
    getdate=$(date | sed 's/ //g')                                                  #   get the current date, remove spaces with POSIX expression
    curl -output $REPLY                                                             #   use curl to connect to the input url, the -output flag indicates to return in html

    if [ -f "utput" ]                                                               #   check a file named "utput" exists (default returned filename from previous expression)
    then
        mv utput ./snapshots                                                        #   move the file into snapshots directory
        cd ./snapshots                                                              #   change directory into snapshots
        mv utput ${getdate}.html                                                    #   rename "utput" to the value of getdate + ".html"
        cd ../                                                                      #   return to the projects base directory

        echo -e "\e[1;42m Snapshot success! \e[0m"
    else
        echo -e "\e[1;31m Snapshot failed, please try again! \e[0m"
    fi
done