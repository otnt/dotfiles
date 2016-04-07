#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
apt-get update -y -qq && \
apt-get install -y -qq mongodb-org && \
echo -e "${Green}MongoDB installed successfully${NC}"
