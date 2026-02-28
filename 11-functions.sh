#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "please run this script with root user access"
   exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then 
      echo "$2... failure"
      exit 1
   else
      echo "$2 ... sucess"
    fi       
}

echo "installing Nginx"
dnf install nginx -y  
validate $? "installing nginx"


dnf install mysql -y 
validate $? "installing mysql"


dnf install nodejs -y
validate $? "installing nodejs" 







