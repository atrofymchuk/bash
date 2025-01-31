#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "No argument or too many arguments, you need to use one argument."
  echo "For example: ./task10.sh griddynamics.com"
  exit 1
else
  echo "A records for domin: $1"
  dig +short $1
  echo "NS records or domin: $1"
  dig +short NS $1
  echo "MX records or domin: $1"
  dig +short MX $1
  echo "PTR records for all A records domain: $1"
  dig +short $1 > record.txt
  file=./record.txt
  [[ -f ${file} ]] || exit 1
  while read -r line; do
  dig +short -x $line
  done < $file
fi
