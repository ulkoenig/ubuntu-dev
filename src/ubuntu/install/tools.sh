#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y apt-utils vim wget curl net-tools locales bzip2 git-core jq tree \
    python-numpy #used for websockify/novnc
apt-get clean -y

echo "Install yq"
apt install software-properties-common -y
add-apt-repository ppa:rmescandon/yq
apt update
apt install yq -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
