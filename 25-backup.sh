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

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S" ) | $1" | tee -a $LOGS_FILE
}

if [ $# -lt 2 ]; then
   USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
    echo "$RED Source Directory: $SOURCE_DIR does not exist $N"
    exit 1
fi    

if [ ! -d $DEST_DIR ]; then
   echo "$RED Destinantion Directory: $DEST_DIR does not exist $N"
   exit 1
fi

### Find the files
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)
echo "Back "

log "Back up started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"
