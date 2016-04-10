#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# Java 8
# The first two lines suppress oracle java's liscence pop up window
# See here: http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && \
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && \
add-apt-repository ppa:webupd8team/java -y && \
apt-get update -y -qq && \
apt-get install oracle-java8-installer -y -qq && \
apt-get install oracle-java8-set-default -y -qq && \
echo -e "${Green}Java 8 installed successfully${NC}"
