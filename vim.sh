#!/usr/bin/env bash

# This script is used to install vim with AWESOME support
# [Warning]: If you already have .vimrc in you home folder, please have a backup before running this script.
#            Although this script will auto backup .vimrc (if exists) to .vimrc_backup in home folder.

USERHOME=$HOME
USERNAME=`whoami`

# backup .vimrc
if [ -f $HOME/.vimrc ];
then 
  cp $HOME/.vimrc $HOME/.vimrc_backup
fi

# install basic tools
apt-get update -y && \
apt-get install -y build-essential cmake git python-dev python3-dev wget software-properties-common

# install vim
add-apt-repository ppa:fcwu-tw/ppa -y && \
apt-get update -y && \
apt-get install vim -y

# We're using the ultimate vim configuration as our base configuration
# https://github.com/amix/vimrc
git clone https://github.com/amix/vimrc.git $USERHOME/.vim_runtime && \
sh $USERHOME/.vim_runtime/install_awesome_vimrc.sh

# my vim config file, supplementary to ultimate vim
wget https://raw.githubusercontent.com/otnt/dotfiles/master/my_configs.vim  -O $USERHOME/.vim_runtime/my_configs.vim
chown -R $USERNAME $USERHOME/.vim_runtime

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git $USERHOME/.vim/bundle/Vundle.vim

# We are going to configure YouCompleteMe, which is missing in ultimate vim
# configuration. Note YouCompleteMe is a little bit tricky, it needs some
# extra dependency, and also needs recompile each time you want to update it.
git clone https://github.com/Valloric/YouCompleteMe.git $USERHOME/.vim/bundle/YouCompleteMe && \
cd $USERHOME/.vim/bundle/YouCompleteMe && \
git submodule update --init --recursive && \
cd $USERHOME && \
mkdir ycm_build

# change mode
chown -R $USERNAME $USERHOME/.vim_runtime
chown -R $USERNAME $USERHOME/.vim

# skip this step if you don't need c-family language support
cd $USERHOME/ycm_build && \
mkdir clang++ && \
wget http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz && \
tar -xf clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz -C clang++ --strip-components=1 && \
rm clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
chown -R $USERNAME $USERHOME/ycm_build

cd $USERHOME/ycm_build && \
# if don't need c-family language support
# cmake -G "Unix Makefiles" . $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp && \
# otherwise
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=$USERHOME/ycm_build/clang++ . $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp && \
# build it in both cases
cmake --build . --target ycm_core

# Golang support
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/golang.sh | /bin/bash && \
cd $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/gocode && \
go build

# JS support
curl -sL https://raw.githubusercontent.com/otnt/dotfiles/master/node.sh | /bin/bash && \
cd $USERHOME/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime && \
npm install --production

# update plugins
vim +PluginInstall +qall
