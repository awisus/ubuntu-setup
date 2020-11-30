#!/bin/bash

sudo snap remove --purge firefox

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000

Package: firefox*
Pin: release o=Ubuntu
Pin-Priority: -1' | sudo tee /etc/apt/preferences.d/mozilla

sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install firefox
