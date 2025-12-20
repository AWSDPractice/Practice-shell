#!/bin/bash

MSG="$SCRIPT1"
GREET="Hi from Script1"
source ./20-script2.sh

echo "hi from: $MSG"

#sh 20-script2.sh