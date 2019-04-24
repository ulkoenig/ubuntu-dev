#!/usr/bin/env bash

### every exit != 0 fails the script

set -e
### Install nodejs
function install_nodejs {
  echo "Install nodejs Version 6"
  # apt-get update and clean should only run ones in the Dockerfile
  # apt-get update
  curl -sL https://deb.nodesource.com/setup_8.x | bash -
  apt-get install -y nodejs
  apt-get install -y build-essential
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
        install_nodejs
    fi

fi



