#!/bin/bash

echo "all arg passed to script: $@  treates as seperates ariable '
, $* treates as single variable"
echo "no of arg passed to the script: $#"
echo "present working directory: $PWD"
echo "home directory of thr user: $USER"
sleep 100
echo "pid of the recent executed background process background process : $!"
echo "pid of the script-$$"
echo "script name: $0"
echo "exit code: $? ,0 is success,other number is failure"
user_id=$(id -u)
echo "ROOT USER: $user_id ,0 is rootuser,other number is rootuser"

