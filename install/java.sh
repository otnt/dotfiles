#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# Java 8
add-apt-repository ppa:webupd8team/java -y && \
apt-get update -y -qq && \
apt-get install oracle-java8-installer -y -qq && \
apt-get install oracle-java8-set-default -y -qq && \
echo -e "${Green}Java 8 installed successfully${NC}"
