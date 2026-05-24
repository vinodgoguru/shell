#!/bin/bash

USERID=$(id -u)

# Check root access or not

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root acess"
    exit 1
fi

# First arg --> what are you trying to install
# Second arg --> exit code

VALIDATE(){
    if [ $? -ne 0 ]; then
        echo " Installing $1 is ...failed "
    else
        echo " Installing $1 is .. Success"
    fi

}

# echo "I am continuning "

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo " Mysql is already installed ... SKIPPING "
else  
    echo "Installing MYSQL"
    dnf install mysql -y
    VALIDATE mysql $?

fi

dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "Nginx is already installed.. SKIPPING"
else
    echo "Installing Nginx"
    dnf install nginx -y
    VALIDATE nginx $?
fi



