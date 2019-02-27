#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install display resolution for Dell notebook"
echo >> "xrandr --addmode VNC-0 1600x900_60.00" >> $HOME/.profile
echo >> "xrandr --newmode \"1600x900_60.00\"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync" >> $HOME/.profile
