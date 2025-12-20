#!/bin/bash

#no need to check user id ..in real time user already the access to do the task
#thats why here i am not user has root access or not means user id not checking here

 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"

SOURCE_DIR=$1
DES_DIR=$2
DAYS=${3:-14} #if user not providing no.of datys we are taking 14 days as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
 LOG_FILE=$(echo $0 | cut -d "." -f1)
 TIMESTAMP=$(date +%Y-%m-%d-%H-%M)
 LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

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

USAGE(){
    echo -e "$R USAGE:: $N sh-backup.sh <SOURCE_DIR> <DES_DIR> <DAYS(Optional)>"
    exit 1
}


if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR does not exist...please check"
    exit 1
fi

if [ ! -d $DES_DIR ]
then
    echo -e "$DES_DIR does not exist...please check"
    exit -1
fi

 echo "script started at: $TIMESTAMP"  &>>$LOG_FILE_NAME

 FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)


 if [ -n "$FILES" ]  #true if there are files to zip
 then
    echo "Files are: $FILES"
    ZIP_FILE="$DES_DIR/app-logs-$TIMESTAMP.zip"
    FILES | zip -@ "$ZIP_FILES"
else 
    echo "no files found older than $DAYS"
fi