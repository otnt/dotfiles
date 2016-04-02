VIMDIR="$USER_HOME/.vim_runtime" #do not change this if you are using default vim configuration

# We're using the ultimate vim configuration as our base configuration
# https://github.com/amix/vimrc
git clone https://github.com/amix/vimrc.git $VIMDIR
sh $VIMDIR/install_awesome_vimrc.sh
chown -R $USERNAME $VIMDIR

# We are going to configure YouCompleteMe, which is missing in ultimate vim
# configuration. Note YouCompleteMe is a little bit tricky, it needs some
# extra dependency, and also needs recompile each time you want to update it.

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git $USER_HOME/.vim/bundle/Vundle.vim
cat ./vimrc_vundle.txt >> ./vim_tmp
cat $USER_HOME/.vimrc >> ./vim_tmp
cat ./vim_tmp > $USER_HOME/.vimrc
rm ./vim_tmp
chmod 777 $USER_HOME/.vimrc

# Cmake
apt-get install build-essential cmake -y

# YouCompleteMe Repo, compile and install
git clone https://github.com/Valloric/YouCompleteMe.git $USER_HOME/.vim/bundle/YouCompleteMe
cd $USER_HOME/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

# C family, Go, Javascript, Python
./install.py --clang-completer --gocode-completer --tern-completer
vim +PluginInstall +qall

# make sure everything works
chmod -R 777 $USER_HOME/.vim #change to 777, otherwise will have error when opening vim
chmod -R 777 $VIMDIR
