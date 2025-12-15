#!/bin/bash 
 
 USERID=$(id -u)

VALIDATE(){

     if [ $1 -gt 0 ]
    then
        echo "$2 ....FAILURE"
        exit 1
    else 
        echo "$2..Success"
    fi

}

 if [ $USERID -gt 0 ]
 then
    echo "ERROR ::You must have sudo access to execute this script"
    exit 1 # other than 0
fi 

dnf list installed mysql

if [$? -gt 0]
then
    dnf install mysql -y  
    VALIDATE $?
else
    echo "MYSQL is already installed"
fi

dnf list installed git

if [ $? -ne 0]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
   
else
    echo " git is already installed"
fi  
