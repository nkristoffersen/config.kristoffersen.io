#!/bin/bash
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get install -y wavemon
sudo apt-get install -y screen
sudo apt-get install -y vim
sudo apt-get install -y git
sudo apt-get install -y iftop
sudo apt-get install -y iotop
sudo apt-get install -y dnsutils
sudo apt-get install -y htop
sudo apt-get install -y autossh
sudo apt-get install -y dnsmasq
sudo apt-get install -y postfix

sudo apt-get install -y unattended-upgrades
sudo apt-get install -y apt-listchanges
wget http://node-arm.herokuapp.com/node_latest_armhf.deb && sudo dpkg -i node_latest_armhf.deb
sudo apt-get install -y libudev-dev
sudo npm install forever -g
sudo npm install forever-service -g
sudo curl -o /usr/local/bin/rmate https://raw.githubusercontent.com/aurora/rmate/master/rmate
sudo chmod +x /usr/local/bin/rmate
mkdir .vim
mkdir .vim/colors
wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim && mv onedark.vim .vim/colors/onedark.vim
