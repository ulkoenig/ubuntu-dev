#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Eclipse"
apt-get update
apt-get install -y default-jdk
apt-get clean -y
wget http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/photon/M2/eclipse-dsl-photon-M2-linux-gtk-x86_64.tar.gz -O eclipse.tag.gz
mkdir /usr/local/etc/eclipse
tar -xzf eclipse.tag.gz -C /usr/local/etc/eclipse/
ln -s /usr/local/etc/eclipse/eclipse/eclipse /usr/local/bin/eclipse