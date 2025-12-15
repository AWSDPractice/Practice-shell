#1/bin/bash

 USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 y="\e[33m"


VALIDATE(){

     if [ $1 -gt 0 ]
    then
        echo -e "$2 ....$R FAILURE"
        exit 1
    else 
        echo -e "$2..$G Success"
    fi

}

 if [ $USERID -gt 0 ]
 then
    echo "ERROR ::You must have sudo access to execute this script"
    exit 1 # other than 0
fi 

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y  
    VALIDATE $?
else
    echo -e " MYSQL is already $Y.... installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing Git"
   
else
    echo -e "git is already  $Y.....installed"
fi  
