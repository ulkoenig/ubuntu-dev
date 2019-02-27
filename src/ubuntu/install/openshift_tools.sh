#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install OC Client"

wget https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz -O openshift.tar.gz

tar -xzf openshift.tar.gz -C /usr/local/etc/
rm openshift.tar.gz
ln -s /usr/local/etc/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit/oc /usr/local/bin/oc

echo "Install Helm"
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-linux-amd64.tar.gz -O helm-v2.9.0-linux-amd64.tar.gz 
tar -xzf helm-v2.9.0-linux-amd64.tar.gz -C /usr/local/etc/
rm helm-v2.9.0-linux-amd64.tar.gz
ln -s /usr/local/etc/linux-amd64/helm /usr/local/bin/helm
