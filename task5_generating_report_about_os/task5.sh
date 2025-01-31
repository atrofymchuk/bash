#!/bin/bash
function common_param {
  echo "Current date: `date +%d-%m-%Y`"
  echo "Current time: `date +%H:%M`"
  echo "Name of current user: $USER"
  echo "Hostname: `hostname`"
  IP=$(curl -s ident.me)
  echo "External IP address: $IP"
  echo "Information about used and free space:"
  echo "`df -h`"
}
function darwin_os {
  common_param 
  echo "Internal IP address: `ipconfig getifaddr en0`"
  echo "Name of distribution: `sw_vers | grep ProductName | cut -c14-`"
  echo "Version of distribution: `sw_vers | grep ProductVersion | cut -c17-`"
  echo "System uptime: `uptime | cut -c 10-11 ` days `uptime | cut -c 1-2` hours `uptime | cut -c 4-5` minutes"
  echo "Information about total and free RAM:"
  echo "`top -l 1 -s 0 | grep PhysMem`"
  echo "Number of CPU cores: `sysctl -a | grep machdep.cpu.core_count: | cut -c25-`"

}
function linux_os {
  common_param 
  echo "Internal IP address: `hostname -I`"
  echo "Name and version of Linux distribution: `cat /etc/*-release | grep PRETTY_NAME | cut -c13-`";
  echo "Version of Linux distribution: `cat /etc/*-release | grep VERSION= | cut -c9-`";
  echo "System uptime: `uptime | cut -c 10-11 ` days `uptime | cut -c 1-2` hours `uptime | cut -c 4-5` minutes"
  echo "Information about total and free RAM:"
  echo "`free`"
  echo "Number of CPU cores: `cat /proc/cpuinfo | grep "cpu cores" | cut -c13-`"
  echo "Frequency of CPU cores: `cat /proc/cpuinfo| grep "cpu MHz" | cut -c12-`"
}
case "$OSTYPE" in
  darwin*) darwin_os;; 
  linux*) linux_os;;
esac
