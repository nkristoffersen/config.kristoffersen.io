#Config new Raspberry PI

### run bash script

```
$ curl https://raw.githubusercontent.com/nkristoffersen/config.kristoffersen.io/master/raspberry-config.sh | bash
```

### create raspbian-lite image on SD card

https://www.raspberrypi.org/downloads/raspbian/

https://www.raspberrypi.org/documentation/installation/installing-images/README.md

### allow ssh

add `/boot/ssh` file to root of SD card

### create wpa_supplicant

add `/boot/wpa_supplicant.conf` to root of SD card

edit file
```
network={
  ssid="YOUR_SSID"
  psk="YOUR_PASSWORD"
  key_mgmt=WPA-PSK
}
```

### change gpu memory split. add this line to file `/boot/config.txt`
```
gpu_mem=16  
```

### allow for connecting things to the network port at the same time as wifi
(should rewrite this tutorial to work specifically for my usecase)
https://www.raspberrypi.org/forums/viewtopic.php?t=132674
```
$ sudo vim /etc/network/interfaces
```
```
#iface eth0 inet manual
allow-hotplug eth0
iface eth0 inet static  
    address 192.168.1.1
    netmask 255.255.255.0
    network 192.168.1.0
    broadcast 192.168.1.255
```
```
$ sudo vim /etc/sysctl.conf
```
```
net.ipv4.ip_forward=1 //uncomment this line
```

### boot and ssh into pi

`$ ssh pi@<pi ip address>`

default password is `raspberry`

### update image

```
$ sudo passwd //create new password
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install wavemon // to view wifi quality
$ sudo apt-get install screen
$ sudo apt-get install vim //for quick edits
$ sudo apt-get install git
$ sudo apt-get install dnsutils
$ sudo apt-get install htop //to quickly check the memory and cpu usage
```

### enable desktop

```
$ sudo apt-get install raspberrypi-ui-mods
$ sudo systemctl start lightdm
$ sudo apt-get install chromium-browser
```

### install pathogen
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

### install pathogen plugins
```
cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
```

### install node and global node tools

```
$ wget http://node-arm.herokuapp.com/node_latest_armhf.deb && sudo dpkg -i node_latest_armhf.deb
$ sudo apt-get install -y libudev-dev
$ sudo npm install forever -g
$ sudo npm install forever-service -g
```

### install rmate (enable editing on host ide)

enable on host code editor
- visual studio code: https://github.com/rafaelmaiolla/remote-vscode
- atom: https://atom.io/packages/remote-atom

install rmate on pi
```
$ sudo curl -o /usr/local/bin/rmate https://raw.githubusercontent.com/aurora/rmate/master/rmate
$ sudo chmod +x /usr/local/bin/rmate
```

to use just ssh with port forwarding
```
$ ssh -R 52698:localhost:52698 pi@<pi ip address>
```

### install atom colors for vim

```
$ cd .vim/colors
$ wget https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim
```

### set .vimrc

```
"vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'Yggdroot/indentLine'
call vundle#end()
filetype plugin indent on

"other
execute pathogen#infect()
syntax on
set number
set tabstop=4
set list lcs=tab:\|\
autocmd VimEnter * Minimap
set softtabstop=4
set expandtab
"set showcmd
set cursorline
"set wildmenu
set lazyredraw
set showmatch
set laststatus=2
set noshowmode
colorscheme onedark
```

### set .inputrc
create `~/.inputrc` and add the following line
```
set editing-mode vi
```

### running node service in production

this is create an OS level service that will run automatically on system boot. This is important to handle power outages, etc.

```
$ sudo forever-service install <new service name> --script index.js
$ sudo service <service name> start
```

### stopping service

disable for development
```
$ sudo service <service name> stop
```

or more permanent (to prevent it starting on reboot)
```
$ sudo forever-service delete <service name>
```

### other useful terminal commands
```
$ df -h // get disk usage in human readable format
$ ab -n 200 -c 200 http://barleyboard.com/ // -n is total number of requests to perform and -c is number of requests to make at once
$ screen // hit [ctr]+[a] then [c] to create a new screen. then hit [ctrl]+[a] twice to switch between screens.
$ cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2 //get serial number of raspberry pi
```
### crontab for auto update
```
$ sudo su
$ crontab -e
```
then add this to the crontab
```
0 4 * * 1 wget -O - https://raw.githubusercontent.com/nkristoffersen/config.kristoffersen.io/master/raspberry-update.sh | bash 2>&1 | /usr/bin/logger -t raspberry-update
```
