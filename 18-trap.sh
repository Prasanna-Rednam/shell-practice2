#!/bin/bash

set -e #ERR

trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND' ERR

echo "Hello world"
echo "i am learning shell"
echoo "printing error here"
echo "no error is here"