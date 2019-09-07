#!/bin/bash

#######################################################################
# Author: Royce                                                       #
#                                                                     #
# Modified 2018-08-26                                                 #
# ****************** FOR UBUNTU USE ONLY ******************           #
# I got lazy so I created an update script to keep this ho up-to-date #
#######################################################################
echo "Time to get these updates mayne! "
check_exit_status() {

        if [ $? -eq 0 ]
        then
           echo
           echo "Success"
           echo
        else

           echo
           echo "[ERROR] Process messed up bruh bruh!"
           echo

           read -p "The last command exited with an error. Exit script? (yes/no)" answer

           if [ "$answer" == "yes" ]
           then
                exit 1
           fi

     fi
 }
greeting() {

        echo
        echo "Hello, $USER. Let's update this system. "
        echo
}
update() {

        sudo apt-get update;
        check_exit_status

        sudo apt-get upgrade -y;
        check_exit_status

        sudo apt-get dist-upgrade -y;
        check_exit_status
        check_exit_status
}
cleanuptime() {

        sudo apt-get autoremove -y;
        check_exit_status

        sudo apt-get autoclean -y;
        check_exit_status

        sudo updatedb;
        check_exit_status
}
bounce() {
        echo
        echo "---------------------------------"
        echo "- Ok We Good, Update Complete! -"
        echo "---------------------------------"
        echo
        exit
}
greeting
update
cleanuptime
