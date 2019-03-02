#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install apt-utils and locales first"
apt-get update 
apt-get install -y apt-utils locales
apt-get clean -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
