#!/bin/bash

sudo add-apt-repository ppa:obsproject/obs-studio -y
# FIXME: remove workaround once fiex by developers
sudo mv udp apt etc/apt/sources.list.d/obsproject-ubuntu-obs-studio-resolute.sources /etc/apt/sources.list.d/obsproject-ubuntu-obs-studio-mantic.sources
sudo sed --in-place --expression='/^Suites:/c\Suites: mantic' /etc/apt/sources.list.d/obsproject-ubuntu-obs-studio-mantic.sources

sudo apt update
sudo apt install -y obs-studio obs-plugins
sudo modprobe v4l2loopback exclusive_caps=1 card_label="OBS Virtual Camera"
