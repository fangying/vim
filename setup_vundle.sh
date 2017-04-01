#!/bin/sh

echo "Step1: clone vunble into .vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Step2: replace my vimrc file"
if [ ! -f ~/.vimrc.bak ]; then
	mv ~/.vimrc ~/.vimrc.bak
fi
cp vimrc_new ~/.vimrc -vf

echo "Step3: enable vunble plugin"
vim +PluginInstall +qall

echo "Let's rock man, cause all is done!"

