#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'
 
printf "${GREEN}Git configurations...${NC}\n"
git config --global user.email "jualjiman@gmail.com"
git config --global user.name "Juan Alberto Jimenez"

printf "${GREEN}Adding repositories...${NC}\n"
# nodejs
add-apt-repository -y ppa:chris-lea/node.js
# elementary tweaks
add-apt-repository -y ppa:mpstark/elementary-tweaks-daily
# sublime text 3
add-apt-repository -y ppa:webupd8team/sublime-text-3
# google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
# virtual box
sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list'
wget http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -

apt-get -y update
apt-get -y upgrade

printf "${GREEN}Installing common tools...${NC}\n"
apt-get install -y git htop python-pip python-dev cmake build-essential nodejs \
google-chrome-stable sublime-text-installer qbittorrent gparted virtualbox-4.3 \
vagrant fabric elementary-tweaks python-virtualenv

printf "${GREEN}Installing Stylus css precompiler...${NC}\n"
npm install stylus -g

printf "${GREEN}Installing VIM and personal configurations...${NC}\n"
apt-get -y install vim
mkdir ~/.vim
ln -s $PWD/vim-confs/.vimrc ~/.vimrc
ln -s $PWD/vim-confs/colors ~/.vim/colors
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

printf "${GREEN}Installing zsh${NC}\n"
apt-get -y install zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
chsh -s `which zsh` jualjiman
rm ~/.zshrc
ln -s $PWD/zsh/.zshrc ~/.zshrc

# vim +BundleInstall
