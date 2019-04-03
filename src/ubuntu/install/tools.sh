#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
# apt-get update and clean should only run ones in the Dockerfile
# apt-get update 
apt-get install -y \
        apt-utils \
        bzip2 \
        curl \
        git-core \
        jq \
        locales \
        net-tools \
        python-numpy #used for websockify/novnc
        tree \
        vim \
        wget
# apt-get clean -y

echo "generate locales für en_US.UTF-8"
locale-gen en_US.UTF-8
