#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y wavemon
sudo apt-get install -y screen
sudo apt-get install -y vim
sudo apt-get install -y git
sudo apt-get install -y dnsutils
sudo apt-get install -y htop
mdkir .vim
mkdir .vim/colors
cd .vim/colors
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
