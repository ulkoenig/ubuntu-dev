#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "############## Install pip and some python tools #############"
function install_pip {
  #add-apt-repository ppa:jonathonf/python-3.6
  #apt-get update 
  #apt-get install -y install python3.6 
  #apt-get clean -y
  wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py
  python get-pip.py
  pip install yq
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
    echo $INSTALL
    if [ "$INSTALL" = true ] || [ "$INSTALL" = TRUE ] ||  [ "$INSTALL" = True ]
    then
        install_pip   
    fi
fi