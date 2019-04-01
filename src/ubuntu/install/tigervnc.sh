#!/usr/bin/env bash
set -e
set -u

echo "Install TigerVNC server"
# change from version 1.8.0 to 1.9.0
wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.9.0.x86_64.tar.gz | tar xz --strip 1 -C /

