





#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install IntelliJ"
wget https://www.jetbrains.com/idea/download/download-thanks.html?platform=linuxWithoutJDK&code=IIC -O intellij.tar.gz
tar -xzf intellij.tar.gz -C /usr/local/etc/
# ln -s /usr/local/etc/intellij/intellij /usr/local/bin/intellij