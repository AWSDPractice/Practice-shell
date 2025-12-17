
#!/bin/bash

 USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 y="\e[33m"

 LOGS_FOLDER="var/log/Practiceshell-logs"
 LOG_FILE=$(echo $0 | cut -d "." -f1)
 TIME_STAMP=$(date +%Y-%m-%d-%H-%M)
 LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIME_STAMP.log"


VALIDATE(){

     if [ $1 -gt 0 ]
    then
        echo -e "$2 ....$R FAILURE"
        exit 1
    else 
        echo -e "$2..$G Success"
    fi

}

echo "script executed at: $TIME_STAMP"  &>>$LOG_FILE

 if [ $USERID -gt 0 ]
 then
    echo "ERROR ::You must have sudo access to execute this script"
    exit 1 # other than 0
fi 

    dnf list installed mysql  &>>$LOG_FILE

if [ $? -ne 0 ]
then
    dnf install mysql -y  &>>$LOG_FILE
    VALIDATE $?
else
    echo -e "MYSQL is already.... $y INSTALLED"
fi

    dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y  &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"   
else
    echo -e "Git is already ... $y INSTALLED"
fi  
