# Task:
Write a program that performs file backups (/etc/passwd, /etc/group, /etc/shadow). 
Add files to tar archive, name it as backup_{system_date_and_time} and put it to your home directory. 
Print out tar archives, which are located in your home folder. 
This should return last 10 archives. All other should be deleted. 
Also execute this script on daily basis.

# Solution:
This script run without argument.
You need to add cron task by command "crontab -e":

```
0 3 * * * /bin/bash /path_to_the_script/task_1_a.sh
```