# update package manager and install basic tools
apt-get update -y && \
apt-get install -y curl git wget

# install AWESOME vim
wget https://raw.githubusercontent.com/otnt/dotfiles/master/install/vim.sh && \
/bin/bash vim.sh

# install tmux
wget https://raw.githubusercontent.com/otnt/dotfiles/master/install/tmux.sh && \
/bin/bash tmux.sh
