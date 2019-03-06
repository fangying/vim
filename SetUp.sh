#!/bin/sh

echo "Step1: clone Plug.vim into .vim"
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Step2: replace my vimrc file"
if [ ! -f ~/.vimrc.bak ]; then
	mv ~/.vimrc ~/.vimrc.bak
fi

cp vimrc ~/.vimrc -vf

echo "Step3: enable vunble plugin"
vim +PlugInstall +qall
