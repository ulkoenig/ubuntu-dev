#!/usr/bin/env bash

 ### every exit != 0 fails the script

 set -e

 echo "Install Visual Code Editor"

 wget http://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
 dpkg --configure -a
 
 echo "install libs first"
 apt-get update
 apt-get install -y libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 
 apt-get install -f
 
 echo "now install vscode"
 dpkg -i vscode.deb
 
 apt-get install -f
 
 apt-get clean -y
