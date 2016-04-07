#!/bin/bash
# This script is used to install vim with AWESOME support
# [Warning]: If you already have .vimrc in you home folder, please have a backup before running this script.
#            Although this script will auto backup .vimrc (if exists) to .vimrc_backup in home folder.
# [Usage]: Fork this script, modify USERHOME and USERNAME to your need, then `/bin/bash vim.sh`. Enjoy!

#################### Modify below please #######################
USERHOME=/home/vagrant
USERNAME=vagrant
#################### Modify above please #######################

Green='\033[0;32m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

# backup .vimrc
if [ -f $HOME/.vimrc ];
then 
  cp $HOME/.vimrc $HOME/.vimrc_backup
fi

# install basic tools
apt-get update -qq && \
apt-get install -y -qq curl && \
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/basic_tools.sh | /bin/bash

# install vim
add-apt-repository ppa:fcwu-tw/ppa -y && \
apt-get update -y -qq && \
apt-get install -y -qq vim && \
echo -e "${Green}Vim installed successfully${NC}"

# We're using the ultimate vim configuration as our base configuration
# https://github.com/amix/vimrc
git clone https://github.com/amix/vimrc.git $USERHOME/.vim_runtime -q && \
sh $USERHOME/.vim_runtime/install_awesome_vimrc.sh && \
echo -e "${Green}Ultimate Vim installed successfully${NC}"

# my vim config file, supplementary to ultimate vim
wget https://raw.githubusercontent.com/otnt/dotfiles/master/confige/.vimrc -O $USERHOME/.vim_runtime/my_configs.vim -q

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git $USERHOME/.vim/bundle/Vundle.vim -q && \
echo -e "${Green}Vundle installed successfully${NC}"

# We are going to configure YouCompleteMe, which is missing in ultimate vim
# configuration. Note YouCompleteMe is a little bit tricky, it needs some
# extra dependency, and also needs recompile each time you want to update it.
git clone https://github.com/Valloric/YouCompleteMe.git $USERHOME/.vim/bundle/YouCompleteMe -q && \
cd $USERHOME/.vim/bundle/YouCompleteMe && \
git submodule update --init --recursive -q && \
cd $USERHOME && \
mkdir ycm_build && \
echo -e "${Green}YouCompleteMe downloaded successfully${NC}"

# skip this step if you don't need c-family language support
cd $USERHOME/ycm_build && \
mkdir clang++ && \
wget http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz -q && \
tar -xf clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz -C clang++ --strip-components=1 && \
rm clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz && \
echo -e "${Green}YouCompleteMe C-family support downloaded successfully${NC}"

cd $USERHOME/ycm_build && \
# if don't need c-family language support
# cmake -G "Unix Makefiles" . $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp && \
# otherwise
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=$USERHOME/ycm_build/clang++ . $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp && \
# build it in both cases
cmake --build . --target ycm_core && \
echo -e "${Green}YouCompleteMe built successfully${NC}"

# Golang support
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/golang.sh | /bin/bash && \
cd $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/gocode && \
go build && \
echo -e "${Green}YouCompleteMe go supported successfully${NC}"

# JS support
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/install/node.sh | /bin/bash && \
cd $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime && \
npm install --production -s && \
echo -e "${Green}YouCompleteMe JS supported successfully${NC}"

# update plugins
vim +PluginInstall +qall
echo -e "${Green}YouCompleteMe plugin installed successfully${NC}"

# change owner
chown -R $USERNAME $USERHOME/.vim_runtime
chown -R $USERNAME $USERHOME/.vim
chown -R $USERNAME $USERHOME/.vimrc

cd $USERHOME
rm -rf $USERHOME/ycm_build
echo -e "${Green}Clean up successfully${NC}"
