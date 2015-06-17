#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
USERNAME='jualjiman' 

printf "${GREEN}GIT CONFIGURATIONS...${NC}\n"
git config --global user.email "jualjiman@gmail.com"
git config --global user.name "Juan Alberto Jimenez"
mkdir ~/Git
chown -R ${USERNAME}:${USERNAME} ~/Git

printf "${GREEN}ADDING REPOSITORIES...${NC}\n"

# nodejs
printf "${GREEN}Node.js...${NC}\n"
wget -qO- https://deb.nodesource.com/setup_0.12 | bash -
#add-apt-repository -y ppa:chris-lea/node.js

# elementary tweaks
# add-apt-repository -y ppa:mpstark/elementary-tweaks-daily

# sublime text 3
printf "${GREEN}Sublimetext 3...${NC}\n"
add-apt-repository -y ppa:webupd8team/sublime-text-3

# google chrome
printf "${GREEN}Google chrome...${NC}\n"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# virtual box
printf "${GREEN}Virtualbox...${NC}\n"
sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list'
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -

apt-get -y update
apt-get -y upgrade

printf "${GREEN}INSTALLING MANDATORY TOOLS...${NC}\n"
apt-get -y install curl

printf "${GREEN}INSTALLING COMMON TOOLS...${NC}\n"
apt-get install -y nmap htop python-pip python-dev cmake build-essential
apt-get install -y nodejs google-chrome-stable sublime-text-installer qbittorrent
apt-get install -y virtualbox-4.3 fabric python-virtualenv

# Install elementary tweaks
# apt-get install -y elementary-tweaks gparted

printf "${GREEN}Installing vagrant...${NC}\n"
mkdir $PWD/vagrant-installation
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb -O $PWD/vagrant-installation/vagrant.deb
dpkg -i $PWD/vagrant-installation/vagrant.deb 
rm -rf $PWD/vagrant-installation/

printf "${GREEN}Installing Stylus css precompiler...${NC}\n"
npm install stylus -g

printf "${GREEN}Installing VIM and personal configurations...${NC}\n"
apt-get -y install vim
mkdir ~/.vim
ln -s $PWD/vim-confs/.vimrc ~/.vimrc
ln -s $PWD/vim-confs/colors ~/.vim/colors
ln -s $PWD/vim-confs/ftplugin ~/.vim/ftplugin
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
chown -R ${USERNAME}:${USERNAME} ~/.vim

printf "${GREEN}Installing zsh...${NC}\n"
apt-get -y install zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s `which zsh` ${USERNAME}
rm ~/.zshrc
ln -s $PWD/zsh/.zshrc ~/.zshrc

apt-get autoremove

vim +BundleInstall
