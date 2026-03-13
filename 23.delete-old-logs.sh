#!/bin/bash

RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
YELLOW="\e[33m"

LOGS_DIR="/root/app-logs"
LOGS_FILE="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
      echo -e "$LOGS_DIR does not exist"
      exit 1
fi

FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -mtime +14)

echo "$FILES_TO_DELETE"

 while IFS= read -r filepath; do
 # Process the line (e.g., print it)
   echo "DELETING FILE: $filepath"
   rm -f $filepath
   echo "Deleted file: $filepath"
 done <<< $FILES_TO_DELETE 