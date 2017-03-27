#!/bin/sh

echo "Step1: clone vbund into .vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Step2: clone my vimrc into ~/.vimrc"
git clone https://github.com/fangying/vim.git vimtemp
mv ~/.vimrc ~/.vimrc.bak
cp vimtemp/vimrc_new ~/.vimrc -vf
rm vimtemp -rf

echo "Step3: enable vbunle plugin"
vim +PluginInstall +qall

echo "Let's rock man, cause all is done!"

