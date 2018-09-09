#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Eclipse"
apt-get update
apt-get install -y default-jdk
apt-get clean -y
wget http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/photon/R/eclipse-java-photon-R-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
mkdir /usr/local/etc/eclipse
tar -xzf eclipse.tar.gz -C /usr/local/etc/eclipse/
ln -s /usr/local/etc/eclipse/eclipse/eclipse /usr/local/bin/eclipse