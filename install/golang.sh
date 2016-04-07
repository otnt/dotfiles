#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# Install latest stable golang
add-apt-repository ppa:ubuntu-lxc/lxd-stable -y -qq &&\
apt-get update -y -qq &&\
apt-get install golang -y -qq && \
echo -e "${Green}Golang installed successfully${NC}"
