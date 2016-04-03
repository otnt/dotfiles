################################################################################
# Initialization script for CopyCat Server Instance                            #
#                                                                              #
# Date: 2016.04.01                                                             #
# Last update: 2016.04.01                                                      #
# Author: Pufan Jiang                                                          #
#                                                                              #
################################################################################

# NOTE:
# If you are running this script in user mode, please use root mode:
# sudo
# If you are running this script in root mode, which is the usual case when
# using this script as init script, then no need to do any other thing.

## Please change this line if necessary!!!
USER_HOME=/home/ubuntu
USERNAME=ubuntu

# dirs
TMPDIR="$USER_HOME/.tmp"
mkdir -p $TMPDIR

# basic configuration, including frequently used software, languages etc.
source basic.sh

# vim configuration
source vim.sh

# tmux configuration
source tmux.sh

# git configuration
source git.sh

# mongodb
source mongodb.sh
