#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Eclipse"
wget http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/photon/M2/eclipse-dsl-photon-M2-linux-gtk-x86_64.tar.gz -O eclipse.tag.gz
mkdir /usr/local/etc
mkdir /usr/local/etc/eclipse

tar -xzf eclipse.tag.gz -C /usr/local/etc/eclipse/
ln -s /usr/local/bin /usr/local/etc/eclipse