#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "user need to get sudo access to proceed"
    exit 1
else
    echo "user have sudo access to install"

fi
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is need to be installed"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "mysql is installed properly :Success"
    else
        echo "Mysql is not installed properly :failure"
        exit 1
    fi
else
    echo "mysql already installed"
    exit 1
fi


