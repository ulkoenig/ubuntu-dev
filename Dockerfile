# This Dockerfile is used to build an headles vnc image based on Ubuntu

FROM ubuntu:16.04

MAINTAINER Ulrich Koenig "ulrich.koenig@telekom.de"
ENV REFRESHED_AT 2019-03-01

LABEL io.k8s.description="Headless VNC Container with Xfce window manager, firefox, chromium and many more" \
      io.k8s.display-name="Headless VNC Container based on Ubuntu" \
      io.openshift.expose-services="6901:http,5901:xvnc" \
      io.openshift.tags="vnc, ubuntu, xfce" \
      io.openshift.non-scalable=true

## Connection ports for controlling the UI:
# VNC port:5901
# noVNC webport, connect via http://IP:6901/?password=vncpassword
ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6901
EXPOSE $VNC_PORT $NO_VNC_PORT

### Envrionment config
ENV HOME=/headless \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/headless/install \
    MOZILLA_HOME=/headless/.mozilla \
    NO_VNC_HOME=/headless/noVNC \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1280x1024 \
    VNC_VIEW_ONLY=false 

### Arguments at build time
ARG INSTALL_OPENSHIFTTOOLS=TRUE
ARG INSTALL_ECLIPSE=FALSE
ARG INSTALL_NETBEANS=FALSE
ARG INSTALL_INTELLIJ=FALSE
ARG INSTALL_POSTMAN=TRUE
ARG INSTALL_DOCKER=TRUE
ARG INSTALL_NODEJS=TRUE
ARG INSTALL_GEDIT=FALSE    

ENV INSTALL_OPENSHIFTTOOLS=$(INSTALL_OPENSHIFTTOOLS) \
    INSTALL_ECLIPSE=$(INSTALL_ECLIPSE) \
    INSTALL_NETBEANS=$(INSTALL_NETBEANS) \
    INSTALL_INTELLIJ=$(INSTALL_INTELLIJ) \
    INSTALL_POSTMAN=$(INSTALL_POSTMAN) \
    INSTALL_DOCKER=$(INSTALL_DOCKER) \
    INSTALL_NODEJS=$(INSTALL_NODEJS) \
    INSTALL_GEDIT=$(INSTALL_GEDIT)   

## set workdir
WORKDIR $HOME

### Add all install scripts for further steps
ADD ./src/common/install/ $INST_SCRIPTS/
ADD ./src/ubuntu/install/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +

### Install some basics and set local environment first
RUN $INST_SCRIPTS/base.sh

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

### Install all additional tools and applications now 
RUN $INST_SCRIPTS/tools.sh && \
    $INST_SCRIPTS/tigervnc.sh && \
    $INST_SCRIPTS/no_vnc.sh && \
    $INST_SCRIPTS/firefox.sh && \
    $INST_SCRIPTS/chrome.sh && \
    $INST_SCRIPTS/xfce_ui.sh && \
    $INST_SCRIPTS/display_resolution.sh && \
    $INST_SCRIPTS/tools_adv.sh && \
    $INST_SCRIPTS/openshift_tools.sh -i $INSTALL_OPENSHIFTTOOLS && \
    $INST_SCRIPTS/postman.sh -i $INSTALL_POSTMAN && \
    $INST_SCRIPTS/eclipse.sh -i $INSTALL_ECLIPSE && \
    $INST_SCRIPTS/docker.sh -i $INSTALL_DOCKER && \
    $INST_SCRIPTS/netbeans.sh -i $INSTALL_NETBEANS && \
    $INST_SCRIPTS/gedit.sh -i $INSTALL_GEDIT && \
    $INST_SCRIPTS/intellij.sh -i $INSTALL_INTELLIJ && \
    $INST_SCRIPTS/tools_nodejs.sh -i $INSTALL_NODEJS
    
ADD ./src/common/xfce/ $HOME/

### Add menue items to application menu
# ADD ./src/common/xfce/application-menu/ /usr/share/menu/

### configure startup
RUN $INST_SCRIPTS/libnss_wrapper.sh
ADD ./src/common/scripts $STARTUPDIR
#ADD ./src/ubuntu/env/.mozilla $MOZILLA_HOME
RUN $INST_SCRIPTS/set_user_permission.sh $STARTUPDIR $HOME

USER 1000

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--wait"]