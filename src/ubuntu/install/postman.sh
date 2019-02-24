#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install Postman"

wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
tar -xzf postman.tar.gz -C /usr/local/etc/
rm postman.tar.gz
ln -s /usr/local/etc/Postman/Postman /usr/local/bin/postman

# Add item to xfce application menu
cat > /usr/share/applications/postman.desktop << EOF
[Desktop Entry]
Name=Postman
GenericName=Postman
GenericName[de]=Postman
GenericName[en]=Postman
Comment=Postman API Development Environment
Exec=/usr/local/bin/postman
Icon=/usr/local/etc/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
StartupNotify=false
Categories=Development
OnlyShowIn=GNOME;XFCE;
EOF