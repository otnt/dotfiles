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

# Node.js
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs
apt-get install -y build-essential
# Update npm
npm install npm -g
# Update nodejs
npm cache clean -f
npm install -g n
n stable

# Java 8
add-apt-repository ppa:webupd8team/java -y
apt-get update -y
apt-get install oracle-java8-installer -y
apt-get install oracle-java8-set-default -y
