#!/bin/sh

echo "Step1: clone Plug.vim into .vim"
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install gtags
wget http://tamacom.com/global/global-6.6.3.tar.gz
tar xf global-6.6.3.tar.gz
autoconf
./configure
make -j
sudo make install

# install universal-ctags
https://github.com/universal-ctags/ctags.git
cd ctags && sudo chmod a+x autogen.sh
./configure
make -j
sudo make install


echo "Step2: replace my vimrc file"
if [ ! -f ~/.vimrc.bak ]; then
	mv ~/.vimrc ~/.vimrc.bak
fi

cp vimrc ~/.vimrc -vf

echo "Step3: enable vunble plugin"
vim +PlugInstall +qall
