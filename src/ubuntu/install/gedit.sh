#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

function install_gedit {
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
        install_gedit
    fi
fi