#!/bin/bash

USERID=$(id -u)

# Check root access or not

if [ $USERID -ne 0 ]; then
    echo "Please run this script with root acess"
    exit 1
fi

echo "I am continuning "
