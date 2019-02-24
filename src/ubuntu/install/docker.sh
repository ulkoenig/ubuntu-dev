#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo 'Installing docker'
apt-get update 
apt-get install -y iptables 
apt-get clean -y

wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/containerd.io_1.2.2-3_amd64.deb -O containerd.deb 
dpkg -i containerd.deb
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.09.2~3-0~ubuntu-xenial_amd64.deb -O docker.deb
dpkg -i docker.deb