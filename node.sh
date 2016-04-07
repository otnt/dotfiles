# Install Node.js, npm, need sudo
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs build-essential
# Update npm
npm install npm -g
# Update nodejs
npm cache clean -f
npm install -g n
n stable
