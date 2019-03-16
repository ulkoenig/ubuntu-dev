#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

function install {
echo "Install Anaconda"

## wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh

wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh -O anaconda.sh
bash anaconda.sh -b -p /usr/local/etc/anaconda
## ln -s /usr/local/etc/anaconda/bin Postman /usr/local/bin/postman

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
        install
    fi
fi