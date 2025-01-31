#!/bin/bash
if [ "$#" -ne 2 ]
then
  echo "No arguments or too many arguments, you need to use two argument."
  echo "For example: ./task6.sh /path_to_access_log_file 192.168.0.1"
  exit 1
else
  file=$1
  [[ -f ${file} ]] || exit 1
  IP=$2
  while read -r line; do
    IP2=`echo $line | awk '{print $1}'`
    USERAGENT=`echo $line | awk '{print $12}'`
    if [ $IP2 == $IP ]
    then 
        echo $line | sed 's/'$IP2'/283.547.12.001/' | sed 's|'$USERAGENT'|Internet Explorer 0.1|g' | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13 $14}'
    else 
        echo $line
    fi
  done < $file
fi
