#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install netbeans"
apt-get update 
apt-get install -y netbeans 
apt-get clean -y

# Add item to xfce application menu
cat > /usr/share/applications/netbeans.desktop << EOF
[Desktop Entry]
Name=Netbeans
GenericName=Netbeans IDE
GenericName[de]=Netbeans IDE
GenericName[en]=Netbeans IDE
Comment=Developer IDE
Exec=netbeans
Icon=/usr/share/netbeans/8.1/nb/netbeans.png
Terminal=false
Type=Application
StartupNotify=false
Categories=Development
OnlyShowIn=GNOME;XFCE;
EOF