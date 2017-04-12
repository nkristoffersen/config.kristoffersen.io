#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install wavemon
sudo apt-get install screen
sudo apt-get install vim
sudo apt-get install git -y
sudo apt-get install dnsutils
sudo apt-get install htop
mdkir .vim
mkdir .vim/colors
cd .vim/colors
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
