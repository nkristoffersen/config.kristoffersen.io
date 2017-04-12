#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wavemon -y
sudo apt-get install screen -y
sudo apt-get install vim -y
sudo apt-get install git -y
sudo apt-get install dnsutils -y
sudo apt-get install htop -y
mdkir .vim
mkdir .vim/colors
cd .vim/colors
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
