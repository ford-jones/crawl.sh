#!/usr/bin/bash

COLOR_BLUE="\x1b[1;34m"
COLOR_GREEN="\x1b[1;32m"
COLOR_RED="\x1b[1;31m"
RESET="\e[0m"

echo -e "${COLOR_BLUE} Welcome to crawl.sh ${RESET}"
echo -e "${COLOR_BLUE} Paste url's below and hit enter to clone html directly from the web.${RESET}"
echo -e "${COLOR_BLUE} Press [Ctrl + C] to escape.${RESET}"

while :                                                                             #   initialise the program
do
    read                                                                            #   read user input, $REPLY with result after ENTER keystroke
    GET_DATE=$(date | sed 's/ //g')                                                 #   get the current date, remove spaces with POSIX expression
    curl -output $REPLY                                                             #   use curl to connect to the input url, the -output flag indicates to return in html

    if [ -f "utput" ]                                                               #   check a file named "utput" exists (default returned filename from previous expression)
    then
        mv utput ./snapshots                                                        #   move the file into snapshots directory
        cd ./snapshots                                                              #   change directory into snapshots
        mv utput ${GET_DATE}.html                                                   #   rename "utput" to the value of getdate + ".html"
        cd ../                                                                      #   return to the projects base directory

        echo -e "${COLOR_GREEN} Snapshot success! ${RESET}"
    else
        echo -e "${COLOR_RED} Snapshot failed, please try again! ${RESET}"
    fi
done
