#!/usr/bin/env bash

### every exit != 0 fails the script

set -e

### Install Visual Code from Microsoft
### TODO Check the install -f and clean steps
function install_vs_code {
  echo "Install Visual Code Editor"
  wget https://az764295.vo.msecnd.net/stable/c6e592b2b5770e40a98cb9c2715a8ef89aec3d74/code_1.30.0-1544567151_amd64.deb -O visual-studio-code-1.30.deb
  #wget https://az764295.vo.msecnd.net/stable/c6e592b2b5770e40a98cb9c2715a8ef89aec3d74/code_1.31.1-1549938243_amd64.deb -O vscode.deb

  dpkg --configure -a
  echo "install libs first"
  
  # apt-get update and clean should only run ones in the Dockerfile
  # apt-get update
  apt-get install -y libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 
  apt-get install -f
  
  echo "now install vscode"
  dpkg -i visual-studio-code-1.30.deb
  apt-get install -f
  # apt-get clean -y
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
        install_vs_code
    fi

fi



