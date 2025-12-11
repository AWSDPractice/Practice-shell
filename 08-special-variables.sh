#!/bin/bash

echo "special variables: $1, $2, $3"
echo "All variables: $@"
echo "no.of variables: $#"
echo "Script name: $0"
echo "Present working directory: $pwd"
echo "home directory of current user: $HOME"
echo "which user is running this script: $USER"
echo "process id of current script : $$"
sleep 60 
echo "process id of last command in background: $!"
