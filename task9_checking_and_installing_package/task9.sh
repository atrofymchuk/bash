#!/bin/bash
echo "Please enter name of package: "
read package
if [ -n "$package" ]
  then
    if [ -f /etc/redhat-release ]; then
      PKG_REDHAT=$(rpm -q $package | grep "is not installed")
        if [ "$PKG_REDHAT" = "package $package is not installed"]; then
          echo "$package is not installed"
          yum install -y $package
        else
          echo "$package is installed"
          echo `$package -v`
       fi
    fi
    if [ -f /etc/lsb-release ]; then
      PKG_DEB=$(dpkg-query -W --showformat='${Status}\n' $package | grep "install ok installed")
      if [ "" = "$PKG_DEB" ]; then
        echo "$package is not installed"
        echo apt install -y $package
      else 
       echo "$package is installed"
       echo `$package -v`
      fi
    fi
  else
    echo "No argument, you need to input name of package."
    echo "For example: nginx"
    exit 1
fi
