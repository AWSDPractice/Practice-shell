#!/bin/bash

 USERID=$(id -u)

 if [ $USERID -gt 0 ]
 then
    echo "ERROR ::You must have sudo access to execute this script"
fi 

dnf install mysql -y  