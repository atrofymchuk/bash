#!/bin/bash

if [ -d ~/backup ]; then
  `mkdir -p ~/backup`
fi
tar -czf ~/backup/backup_`date +%d-%m-%Y-%hh-%mm`.tar.gz -C /etc/passwd /etc/group /etc/shadow
find ~/backup -mtime +10 -delete

ls -l

