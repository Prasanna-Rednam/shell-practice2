#!/bin/bash

USERID=$(id -u)
RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
YELLOW="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
SOURCE_DIR=$1
DEST_DIR=$2
DAY=${3:-14} #14 days is the default value, if the user not supplied



if [ $USERID -ne 0 ]; then
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

if [ ! -d $SOURCE_DIR ]; then
    echo "$RED $SOURCE_DIR does not exist $N"
    exit 1
fi    

if [ ! -d $DEST_DIR ]; then
   echo "$RED $DEST_DIR does not exist $N"
   exit 1
fi