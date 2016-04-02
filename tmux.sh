TMUX_DIR="$USER_HOME/.tmux"
POWERLINE_DIR="$TMUX_DIR/powerline"

# Update to Tmux 2.0
sudo apt-get update -y
sudo apt-get install -y python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -y
sudo apt-get install -y tmux=2.0-1~ppa1~t

# Tmux plugins manager
git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm
cat "./tmux_plugin.conf" >> $USER_HOME/.tmux.conf

tmux source ~/.tmux.conf

