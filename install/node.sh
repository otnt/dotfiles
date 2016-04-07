#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# Install Node.js, npm, need sudo
curl -sL https://deb.nodesource.com/setup_5.x | /bin/bash && \
apt-get install -y -qq nodejs build-essential &&\
echo -e "${Green}npm installed successfully${NC}" && \
# Update npm
npm install npm -g -s && \
# Update nodejs
npm cache clean -f -s && \
npm install -g n -s && \
n stable && \
echo -e "${Green}npm, node, js updated successfully${NC}"
