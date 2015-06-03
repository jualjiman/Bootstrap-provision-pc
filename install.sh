#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'

printf "${GREEN}Updating OS...${NC}\n"
sudo apt-get -y update

printf "${GREEN}Upgrading OS...${NC}\n"
sudo apt-get -y upgrade

printf "${GREEN}Installing OS...${NC}\n"
sudo apt-get install -y git

printf "${GREEN}Now deal with Git ssh permissions...${NC}\n"
printf "${GREEN}then...${NC}\n"
printf "${GREEN}git clone git@github.com:jualjiman/Bootstrap-provision-pc.git ~/.bootstrap-provision-pc${NC}\n"

ssh-keygen
