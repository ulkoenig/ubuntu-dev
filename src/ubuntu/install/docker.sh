#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo 'Installing docker'
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.09.2~3-0~ubuntu-xenial_amd64.deb -O docker.deb
dpkg -i docker.deb