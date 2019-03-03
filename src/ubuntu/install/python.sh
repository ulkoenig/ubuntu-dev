#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "############## Instll Python #############"
function install_python {
  echo 'Installing Python and pip'
  add-apt-repository ppa:jonathonf/python-3.6
  apt-get update 
  apt-get install -y install python3.6 
  apt-get clean -y
  wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py
  python get-pip.py
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
        install_python
    fi
fi