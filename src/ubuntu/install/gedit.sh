#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install gedit GNOME text editor"
apt-get update 
apt-get install -y gedit 
apt-get clean -y

# Add item to xfce application menu
cat > /usr/share/applications/gedit.desktop << EOF
[Desktop Entry]
Name=gedit
GenericName=gedit
GenericName[de]=gedit
GenericName[en]=gedit
Comment=gedit GNOME text editor
Exec=gedit
Icon=/usr/share/gedit/logo/gedit-logo.png
Terminal=false
Type=Application
StartupNotify=false
Categories=Development
OnlyShowIn=GNOME;XFCE;
EOF