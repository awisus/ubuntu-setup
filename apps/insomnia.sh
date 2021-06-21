#!/bin/bash

sudo rm -rf /etc/apt/sources.list.d/insomnia.list
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget -O- https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -

sudo apt update
sudo apt install -y insomnia
