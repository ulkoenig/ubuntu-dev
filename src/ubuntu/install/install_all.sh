#!/bin/bash
#
# 
#

### Install Visual Code from Microsoft
### TODO Check the install -f and clean steps
function install_vs_code {

    echo "Install Visual Code Editor"

    wget http://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb
    dpkg --configure -a
    
    echo "install libs first"
    apt-get update
    apt-get install -y libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 
    apt-get install -f
    
    echo "now install vscode"
    dpkg -i vscode.deb
    
    apt-get install -f
    
    apt-get clean -y
}

### Install nodejs
function install_nodejs {
    echo "Install nodejs"

    apt-get update
    curl -sL https://deb.nodesource.com/setup_6.x | bash -
    apt-get install -y nodejs
    apt-get install -y build-essential
    
    apt-get clean -y

}

### Install Openshift command line tool oc
function install_oc {
    echo "Install OC Client"

    wget https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz -O openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz
        
    gunzip openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz
    tar -xvf openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar
    cd openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit

}



if [ "$#" -lt  "6" ] || [ "$#" -gt "6" ]
   then
    echo "$0 -vs [true|false] -nodejs [true|false] -oc [true|false] "
 else

    while [[ $# > 1 ]]
    do
        key="$1"

        case $key in
            -vs|--vs)
            VS_INSTALL="$2"
            shift # past argument
            ;;
            -nodejs|--nodejs)
            NODEJS_INSTALL="$2"
            shift # past argument
            ;;
            -oc|--oc)
            OC_INSTALL="$2"
            shift # past argument
            ;;
            *)
                    # unknown option
            ;;
        esac
        shift # past argument or value
    done

    if [ "$VS_INSTALL" = true ]
    then
        install_vs_code
    fi

    if [ "$NODEJS_INSTALL" = true ]
    then
        install_nodejs
    fi

    if [ "$OC_INSTALL" = true ]
    then
        install_oc
    fi


fi



