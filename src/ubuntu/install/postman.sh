#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

function install_postman {
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
}

if [ "$#" -lt  "2" ] || [ "$#" -gt "2" ]
   then
    echo "$0 -install [true|false]"
 else

    while [[ $# > 1 ]]
    do
        key="$1"

        case $key in
            -i|--install)
            INSTALL="$2"
            shift # past argument
            ;;
            *)
             # unknown option
            ;;
        esac
        shift # past argument or value
    done

    if [ "$INSTALL" = true ] || [ "$INSTALL" = TRUE ] ||  [ "$INSTALL" = True ]
    then
        install_postman
    fi
fi
