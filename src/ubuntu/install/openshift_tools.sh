#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
function install_openshift {
  echo "Install OpenShift cli oc and Kubernets helm"

  wget https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz -O openshift.tar.gz

  tar -xzf openshift.tar.gz -C /usr/local/etc/
  rm openshift.tar.gz
  ln -s /usr/local/etc/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit/oc /usr/local/bin/oc

  echo "Install Helm"
  wget https://storage.googleapis.com/kubernetes-helm/helm-v2.9.0-linux-amd64.tar.gz -O helm-v2.9.0-linux-amd64.tar.gz 
  tar -xzf helm-v2.9.0-linux-amd64.tar.gz -C /usr/local/etc/
  rm helm-v2.9.0-linux-amd64.tar.gz
  ln -s /usr/local/etc/linux-amd64/helm /usr/local/bin/helm
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
        install_openshift
    fi
fi