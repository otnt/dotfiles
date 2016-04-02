
# Git
apt-get update -y
apt-get install git -y

# Python
apt-get install python-pip -y
apt-get install python-dev python3-dev -y

# Golang
add-apt-repository ppa:ubuntu-lxc/lxd-stable -y
apt-get update -y
apt-get install golang -y

# Javascript
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential
