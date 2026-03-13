#!/bin/bash

USERID=$(id -u)
RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
YELLOW="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"

if [ $USER_ID -ne 0 ]; then
   echo -e "$RED please run this script with root user access $N"
   exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "$RED sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14  days] $N"
    exit 1

}

if [ $# -lt 2 ]; then
   USAGE
fi

