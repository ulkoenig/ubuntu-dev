#!/usr/bin/env bash

 ### every exit != 0 fails the script

 set -e

 echo "Install Visual Code Editor"

 # Use a fix version because of errors with the redirection   
 # wget http://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
 wget https://az764295.vo.msecnd.net/stable/c6e592b2b5770e40a98cb9c2715a8ef89aec3d74/code_1.30.0-1544567151_amd64.deb -O vscode.deb
 
 echo "dpkg configure"
 dpkg --configure -a
 
 echo "install libs first"
 apt-get update
 apt-get install -y libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 
 apt-get install -f
 
 echo "now install vscode"
 dpkg -i vscode.deb
 
 apt-get install -f
 
 apt-get clean -y
