#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" 

# Check root access or not

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root acess"
    exit 1
fi

# First arg --> what are you trying to install
# Second arg --> exit code

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo " Installing $1 is ...failed "
    else
        echo " Installing $1 is .. Success"
    fi

}

for package in $@
do 
    echo "Installing $package"
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "$package" $?
    else
        echo "$package already installed ... SKIPPING "
    fi
done



