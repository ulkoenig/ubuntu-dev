#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

function install_intellij {
echo "Install IntelliJ"

wget https://download.jetbrains.com/idea/ideaIC-2018.3.4.tar.gz -O intellij.tar.gz
tar -xzf intellij.tar.gz -C /usr/local/etc/
ln -s /usr/local/etc/idea*/bin/idea.sh /usr/local/bin/idea.sh

# Add item to xfce application menu
cat > /usr/share/applications/intellij.desktop << EOF
[Desktop Entry]
Name=IntelliJ
GenericName=IntelliJ IDEA
GenericName[de]=IntelliJ IDEA
GenericName[en]=IntelliJ IDEA
Comment=Developer IDE
Exec=idea.sh
Icon=/usr/local/etc/idea-IC-183.5429.30/bin/idea.png
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
        install_intellij
    fi
fi
