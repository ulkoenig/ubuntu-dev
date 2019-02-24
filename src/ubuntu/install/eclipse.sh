#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo 'Installing eclipse'
wget http://ftp.fau.de/eclipse/technology/epp/downloads/release/photon/RC3/eclipse-jee-photon-RC3-linux-gtk-x86_64.tar.gz -O eclipse.tar.gz
tar -xzf eclipse.tar.gz -C /usr/local/etc/
rm eclipse.tar.gz
ln -s /usr/local/etc/eclipse/eclipse /usr/local/bin/eclipse

# Add item to xfce application menu
cat > /usr/share/applications/eclipse.desktop << EOF
[Desktop Entry]
Name=Eclipse
GenericName=Eclipse IDE
GenericName[de]=Eclipse IDE
GenericName[en]=Eclipse IDE
Comment=Developer IDE
Exec=/usr/local/etc/eclipse/eclipse
Icon=/usr/local/etc/eclipse/icon.xpm
Terminal=false
Type=Application
StartupNotify=false
Categories=Development
OnlyShowIn=GNOME;XFCE;
EOF

