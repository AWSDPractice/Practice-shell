#!/bin/bash

 USERID=$(id -u)

 if [ $USERID -gt 0 ]
 then
    echo "ERROR ::You must have sudo access to execute this script"
    exit 1 # other than 0
fi 

dnf install mysql -y  

if [ $? -gt 0 ]
then
    echo "installing mysql ....FAILURE"
    exit 1
else 
    echo "installing mysql...Success"
fi

dnf install git -y

if [$? -ne 0 ]
then 
    echo "installing git ....FAILURE"
    exit 1
else
    echo "installing mysql...SUCCESS"
fi  
