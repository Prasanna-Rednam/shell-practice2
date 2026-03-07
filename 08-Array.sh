#!/bin/bash

NUM1=100
NUM2=prasanna

SUM=$(($NUM1+$NUM2))

echo "Sum is: $SUM"

#array
FRUITS=("Apple" "maongo" "lichi")


echo "fruits are: ${FRUITS[@]}"
echo "fruits are: ${FRUITS[0]}"
echo "fruits are: ${FRUITS[1]}"
echo "fruits are: ${FRUITS[2]}"