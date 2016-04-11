#!/bin/bash
#Configure github for you.

USERHOME=/home/ubuntu

apt-get update -y && \
apt-get install -y wget git && \
wget https://raw.githubusercontent.com/otnt/dotfiles/master/confige/.gitconfig -O $USERHOME/.gitconfig
