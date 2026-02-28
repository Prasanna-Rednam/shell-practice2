#!/bin/bash

SERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "please run this script with root user access"
   exit 1
fi

mkdir -p $LOGS_FOLDER

validate(){
    if [ $1 -ne 0 ]; then 
      echo "$2... failure"
      exit 1
   else
      echo "$2 ... sucess"
    fi       
}

#sudu sh 14-loops.sh nginx mysql nodejs
for package in $@
do 
   dnf install $package -y &>>$LOGS_FILE
   validate $? "$package installation"
done