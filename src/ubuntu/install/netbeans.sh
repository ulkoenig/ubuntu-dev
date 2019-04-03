#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

function install_netbeans {
echo "Install netbeans"
# apt-get update and clean should only run ones in the Dockerfile
# apt-get update 
apt-get install -y netbeans 
# apt-get clean -y

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
        install_netbeans
    fi
fi
