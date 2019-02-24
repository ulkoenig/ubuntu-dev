#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

function install_docker {
  echo 'Installing docker'
  apt-get update 
  apt-get install -y iptables 
  apt-get clean -y

  wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/containerd.io_1.2.2-3_amd64.deb -O containerd.deb 
  dpkg -i containerd.deb
  wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce-cli_18.09.2~3-0~ubuntu-xenial_amd64.deb -O docker-cli.deb
  dpkg -i docker-cli.deb
  wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_18.09.2~3-0~ubuntu-xenial_amd64.deb -O docker.deb
  dpkg -i docker.deb
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
        install_docker
    fi
fi