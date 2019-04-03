#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install IceWM UI components"
# apt-get update and clean should only run ones in the Dockerfile
# apt-get update 
apt-get install -y supervisor icewm xterm xfonts-base xauth xinit
apt-get purge -y pm-utils xscreensaver*
# apt-get clean -y