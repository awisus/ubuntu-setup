#!/bin/bash

sudo apt-get install -y \
     docker.io \
     docker-compose

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker &
