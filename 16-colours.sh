#!/bin/bash

RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
YELLOW="\e[33m"
N="\e[0m"
RID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo -e "$RED please run this script with root user access $N"
   exit 1
fi

mkdir -p $LOGS_FOLDER

validate(){
    if [ $1 -ne 0 ]; then 
      echo -e "$RED $2... failure $N"
    
   else
      echo -e "$GREEN $2 ... sucess $N"
    fi       
}

#sudu sh 14-loops.sh nginx mysql nodejs
for package in $@
do 
   dnf list installed $package &>>$LOGS_FILE
   if [ $? -ne 0 ]; then
     echo -e "$BLUE package is not installed, installing $N $RED $package $N"
     dnf install $package -y &>>$LOGS_FILE
     validate $? " $BLUE $package installation $N"
    else
      echo -e "$YELLOW $package is already installed... skipping $N"
    fi
done