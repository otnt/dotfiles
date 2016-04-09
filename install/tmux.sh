#!/bin/bash
# Install Tmux 2.0 with great plugins
# Maintainer Pufan Jiang<jiangpufan@gmail.com>

USER=ubuntu # modify this if necessary
USER_HOME=/home/$USER
TMUX_DIR="$USER_HOME/.tmux"

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# Update to Tmux 2.0
apt-get update -y -qq && \
apt-get install -y -qq python-software-properties software-properties-common && \
add-apt-repository -y ppa:pi-rho/dev && \
apt-get update -y -qq && \
apt-get install -y -qq tmux=2.0-1~ppa1~t && \
echo -e "${Green}Tmux 2.0 installed successfully${NC}"

# Tmux plugins manager
git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm -q && \
wget -q https://raw.githubusercontent.com/otnt/dotfiles/master/confige/.tmux.conf -O $USER_HOME/.tmux.conf && \
chown -R $USER $TMUX_DIR && \
chown -R $USER $USER_HOME/.tmux.conf && \
echo -e "${Green}Tmux configured successfully${NC}"
echo -e "${Purple}Go into Tmux, and run 'Prefix + I' to install all plugins${NC}"


