#!/bin/bash

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# install basic tools
apt-get update -y -qq && \
apt-get install -y -qq build-essential cmake git python-dev python3-dev wget software-properties-common man && \
echo -e "${Green}Basic tools installed: cmake, git, python, wget, other essential tools${NC}"

