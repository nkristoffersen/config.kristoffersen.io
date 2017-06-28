#!/bin/bash
echo "starting rpi update!"
sudo apt-get update && sudo apt-get dist-upgrade -y
echo "finished rpi update!"
