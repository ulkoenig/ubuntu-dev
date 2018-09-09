#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Eclipse"
apt-get install software-properties-common
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer
wget http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/photon/M2/eclipse-dsl-photon-M2-linux-gtk-x86_64.tar.gz -O eclipse.tag.gz
mkdir /usr/local/etc/eclipse
tar -xzf eclipse.tag.gz -C /usr/local/etc/eclipse/
ln -s /usr/local/etc/eclipse/eclipse/eclipse /usr/local/bin/eclipse