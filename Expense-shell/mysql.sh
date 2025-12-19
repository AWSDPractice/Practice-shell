#!/bin/bash

 USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

LOGS_FOLDER="/var/log/expense-logs"
 LOG_FILE=$(echo $0 | cut -d "." -f1)
 TIME_STAMP=$(date +%Y-%m-%d-%H-%M)
 LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIME_STAMP.log"

#creating log directory
mkdir -p $LOGS_FOLDER

VALIDATE(){

     if [ $1 -ne 0 ]
    then
        echo -e "$2 .... ${R}FAILURE${N}"
        exit 1
    else 
        echo -e "$2 .... ${G}SUCCESS${N}"
    fi

}

CHECK_ROOT (){
 if [ $USERID -ne 0 ]
 then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 # other than 0
fi 
}

echo "script started executing at: $TIME_STAMP" &>>$LOG_FILE_NAME

dnf install mysql-server -y  &>>$LOG_FILE_NAME
VALIDATE $? "installing MYSQL Server"

Systemstl enable mysqld  &>>$LOG_FILE_NAME
VALIDATE $? "Enabling MYSQL Server"

Systemstl start mysqld  &>>$LOG_FILE_NAME
VALIDATE $? "Starting MYSQL Server"

