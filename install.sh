#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'

printf "${GREEN}Updating OS...${NC}\n"
apt-get -y update

printf "${GREEN}Upgrading OS...${NC}\n"
apt-get -y upgrade

printf "${GREEN}Installing OS...${NC}\n"
apt-get install -y git curl

printf "${GREEN}Downloading Bootstrap-provision repository...${NC}\n"
git clone --recursive git@github.com:jualjiman/bootstrap-provision-pc.git ~/.bootstrap-provision-pc

cd ~/.bootstrap-provision-pc

./provision.sh
