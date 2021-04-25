#!/bin/bash

sudo rm -rf /etc/apt/sources.list.d/insomnia.list
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget -O- https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -

sudo apt update
sudo apt install -y insomnia
