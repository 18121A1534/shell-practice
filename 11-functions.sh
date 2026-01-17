#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "user need to get sudo access to proceed"
    exit 1
else
    echo "user have sudo access to install"

fi
validate(){
    if [ $1 -eq 0 ]
    then
        echo "mysql is installed properly :Success"
    else
        echo "Mysql is not installed properly :failure"
        exit 1
    fi
}
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is need to be installed"
    dnf install mysql -y
    validate $? "mysql"
else
    echo "mysql already installed"
fi

# dnf list installed python
# if [ $? -ne 0 ]
# then
#     echo "Python is need to be insatlled"
#     dnf install python -y
#     validate $? "python"
# else
#     echo "python already installed"
# fi

# dnf list installed nginx
# if [ $? -ne 0 ]
# then
#     dnf install nginx
#     validate $? "nginx"
# else
#     echo "already installed"
# fi
