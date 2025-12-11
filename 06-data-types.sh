#!/bin/bash

#datatypes (addition of 2 numbers programme cheddam)

NUMBER1=$1
NUMBER2=$2 
TIMESTAMP=$(date)
echo "script executed at $TIMESTAMP

sum=$($NUMBER1+$NUMBER2)

echo "sum of $NUMBER1+$NUMBER2 is: $sum"
