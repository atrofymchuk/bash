#!/bin/bash
if  [ "$#" -ne 1 ]
  then
    echo "No argument, or too many arguments, you need to use one argument."
    echo "For example: ./task2.sh access.log.5"
    exit 1
  else
    cat $1 | awk '{ print $1}' | uniq -c | sort -n -r | head -5
fi
