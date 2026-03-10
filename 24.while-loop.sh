#!/bin/bash

# count=1

# while [ $count -le 5 ]
# do 
#    echo "count is $count"
#    sleep 1
#    #Increment the coounter
#    ((count++))
# done

#IFS-Internal Feild sepeater 
while IFS= read -r LINE; do
  # Process the line (e.g., print it)
  echo "$LINE"
done < script-1.sh # input which file to read 