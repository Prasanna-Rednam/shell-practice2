#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then 
      echo "less"
elif [ $NUMBER -gt 10 ]; then
      echo "avg"
elif [ $NUMBER -eq 5 ]; then
      echo "num is eq 5"
elif [ $NUMBER -ne 5 ]; then
      echo "num not eq to 5"
else    
      echo "not a number"   
fi        
        