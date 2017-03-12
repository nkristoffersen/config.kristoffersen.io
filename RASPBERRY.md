#Config new Raspberry PI

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

### boot and ssh into pi

`$ ssh pi@<pi ip address>`

default password is `raspberry`

### update image

```
$ sudo passwd //create new password
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install screen
$ sudo apt-get install vim //for quick edits
$ sudo apt-get install git
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

```
$ sudo curl -o /usr/local/bin/rmate https://raw.githubusercontent.com/aurora/rmate/master/rmate
$ sudo chmod +x /usr/local/bin/rmate
```

to use just ssh with port forwarding
```
$ ssh -R 52698:localhost:52698 pi@<pi ip address>
```

### set .vimrc

```
execute pathogen#infect()
syntax on
set number
set tabstop=4
set softtabstop=4
set expandtab
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
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
```
