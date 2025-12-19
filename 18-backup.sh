#!/bin/bash

#no need to check user id ..in real time user already the access to do the task
#thats why here i am not user has root access or not means user id not checking here

 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

SOURCE_DIR=$1
DES_DIR=$2
DAYS=${3: -14} #if user not providing no.of datys we are taking 14 days as default

LOGS_FOLDER="/var/log/shellscript-logs"
 LOG_FILE=$(echo $0 | cut -d "." -f1)
 TIME_STAMP=$(date +%Y-%m-%d-%H-%M)
 LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIME_STAMP.log"

#creating log directory
mkdir -p /home/ec2-user/shellscript-logs/

VALIDATE(){

     if [ $1 -ne 0 ]
    then
        echo -e "$2 .... ${R}FAILURE${N}"
        exit 1
    else 
        echo -e "$2 .... ${G}SUCCESS${N}"
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sh-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then
    USAGE
fi

 echo "script started at: $TIME_STAMP"  &>>$LOG_FILE_NAME