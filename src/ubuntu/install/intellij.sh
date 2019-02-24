





#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install IntelliJ"

wget https://download.jetbrains.com/idea/ideaIC-2018.3.4.tar.gz -O intellij.tar.gz
tar -xzf intellij.tar.gz -C /usr/local/etc/
# ln -s /usr/local/etc/intellij/intellij /usr/local/bin/intellij