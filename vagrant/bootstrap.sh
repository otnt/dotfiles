# update package manager and install basic tools
apt-get update -y && \
apt-get install -y curl git wget

cd /home/ubuntu

# install AWESOME vim
wget https://raw.githubusercontent.com/otnt/dotfiles/master/install/vim.sh && \
/bin/bash vim.sh

# install tmux
wget https://raw.githubusercontent.com/otnt/dotfiles/master/install/tmux.sh && \
/bin/bash tmux.sh

# install docker
wget https://raw.githubusercontent.com/otnt/dotfiles/master/install/docker.sh && \
/bin/bash docker.sh

# configure git
wget https://raw.githubusercontent.com/otnt/dotfiles/master/install/git.sh && \
/bin/bash git.sh

