#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

USERHOME=/home/ubuntu

# Install latest stable golang
add-apt-repository ppa:ubuntu-lxc/lxd-stable -y &&\
apt-get update -y -qq &&\
apt-get install golang -y -qq && \
echo "" >> $USERHOME/.bashrc && \
echo "export GOPATH=$HOME/work" >> $USERHOME/.bashrc && \
echo "export PATH=$PATH:$GOPATH/bin" >> $USERHOME/.bashrc && \
echo -e "${Green}Golang installed successfully.\nPlease log out and log in terminal to enable it.${NC}"
