#!/bin/bash

USERID=$(id -u)

# Check root access or not

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root acess"
    exit 1
fi

# echo "I am continuning "

dnf list installed mysql

if [ $? -eq 0]; then
    echo " Mysql is already installed ... SKIPPING "
else  
    echo "Installing MYSQL"
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo " Installing MYSQL is ...failed "
    else
        echo " Installing MYSQL is .. Success"
    fi
fi


