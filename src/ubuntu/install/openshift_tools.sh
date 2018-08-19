#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install OC Client"

wget https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz -O openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz
  	
gunzip openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz
tar -xvf openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar
cd openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit
export PATH=$PATH:.
