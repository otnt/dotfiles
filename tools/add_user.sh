#!/usr/bin/env bash
# This script is used to create a new user with password in linux system.
# Usage: /bin/bash add_user.sh <user_name> <password>
# 
# Tested uder ubuntu Trusty
# 
# Maintainer: Pufan Jiang <jiangpufan@gmail.com>

usage() {
  echo_red "Usage: /bin/bash add_user.sh <user_name> <password>"
}

wget https://raw.githubusercontent.com/otnt/dotfiles/master/tools/color_output.sh | source && \
if [ "$#" != 2 ]; then
    usage
    exit 1
fi && \
username=$1 && password=$2 && \
useradd -ms /bin/bash $username && \
echo $username:`perl -e "printf('%s', crypt($password, 'password'))"` | chpasswd -e && \
gpasswd -a $username sudo && \
mkdir -p /home/$username && \
chown $username -R /home/$username && \
echo "Create user $username with password $password successfully"

