#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# Python
apt-get update -y -qq && \
apt-get install python-pip -y -qq && \
apt-get install python-dev python3-dev -y -qq && \
echo -e "${Green}Python installed successfully${NC}"

