#!/bin/bash

set -e
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" 
TIME_STAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

trap 'echo "error at $LINENO", command: $BASH_COMMAND"' ERR

# Check root access or not

if [ $USERID -ne 0 ]; then
    echo -e "Please run this script with root acess"
    exit 1
fi

# First arg --> what are you trying to install
# Second arg --> exit code



for package in $@
do 
    echo "$TIME_STAMP Installing $package"
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
      
    else
        echo -e "$TIME_STAMP $package already installed ... $Y SKIPPING $N "
    fi
done



