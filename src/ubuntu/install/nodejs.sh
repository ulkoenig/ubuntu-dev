#!/usr/bin/env bash

 ### every exit != 0 fails the script

 set -e

 echo "Install nodejs"

 apt-get update
 curl -sL https://deb.nodesource.com/setup_6.x | bash -
 apt-get install -y nodejs
 apt-get install -y build-essential
 npm install npm@latest -g
 
 apt-get clean -y
