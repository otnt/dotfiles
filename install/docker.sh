#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# install docker engine
apt-get update -y -qq && \
apt-get install curl -y -qq && \
curl -fsSL https://get.docker.com/ | sh && \
usermod -aG docker `whoami` && \
echo -e "${Green}docker engine installed successfully${NC}" && \
echo -e "${Purple}add user to docker group: usermod -aG docker USER${NC}"

# install docker machine
curl -sL https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine && \
echo -e "${Green}docker machine installed successfully${NC}"
