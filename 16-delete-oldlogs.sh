#!/bin/bash

 USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

SOURCE_DIR="home/ec2-user/app-logs"

LOGS_FOLDER="/var/log/shellscript-logs"
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

 if [ $USERID -ne 0 ]
 then
    echo "ERROR ::You must have sudo access to execute this script"
    exit 1 # other than 0
fi 

echo "script started at: $TIME_STAMP"  &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to be deleted: $FILES_TO_DELETE"

while read -r file
do
    echo "deleting file: $file"

done <<< $FILES_TO_DELETE